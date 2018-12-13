<?php
use Phalcon\Mvc\Controller;
class ReservasiController extends BaseController
{

	public function manageAction()
    {
        if($this->session->get('auth')['status'] != '1'){
            $this->response->redirect();
        }

        $searchBy = $this->request->getPost('searchBy');
        $searchKey = $this->request->getPost('searchKey');
        if($searchBy == 'nama'){
            $searchBy= '%'.$searchBy.'%';
            $reservasis = Reservasi::query()
            ->where('nama LIKE :searchKey:')
            //->andWhere('year < 2000')
            ->bind(['searchKey' => $searchKey ])
            //->order('name')
            ->execute();
        }else if($searchBy == 'judul'){

        }else if($searchBy == 'id buku'){
            $reservasis = Reservasi::find(
                    [
                        'conditions' => "id_buku == :searchKey:" ,
                        'bind'       => [
                            'searchKey' => $searchKey,
                        ]
                    ]
                );
        }else if($searchBy == 'id user'){
            $reservasis = Reservasi::find(
                [
                    'conditions' => "id_user == :searchKey:" ,
                    'bind'       => [
                        'searchKey' => $searchKey,
                    ]
                ]
            );
        }else if($searchBy == 'id reservasi'){
            $reservasis = Reservasi::find(
                [
                    'conditions' => "id == :searchKey:" ,
                    'bind'       => [
                        'searchKey' => $searchKey,
                    ]
                ]
            );
        }

        // $id_buku = $this->request->getPost('kunci');
        // $id_buku= '%'.$id_buku.'%';
        // $reservasis = Reservasi::find(
        //     [
        //         'conditions' => "id LIKE :nama:" ,
        //         'bind'       => [
        //             'nama' => $nama,
        //         ]
        //     ]
        // );
        
        $reservasis = Reservasi::find();


        $users=array();
        $bukus=array();

        foreach ($reservasis as $reservasi){
            $user =  Users::findFirst("id = '$reservasi->id_user'");
            $buku =  Buku::findFirst("id = '$reservasi->id_buku'");

            array_push($users, $user);
            array_push($bukus, $buku);
        }

        $count = 0;
        $this->view->users = $users;
        $this->view->bukus = $bukus;
        $this->view->count = $count;
        $this->view->reservasis = $reservasis;
    }

    public function createAction()
    {
        $reservasi = new Reservasi();

        $id_buku = $this->request->getPost('id_buku');
        $id_user = $this->session->get('auth')['id'];
       

        $reservasi->id_buku = $id_buku;
        $reservasi->id_user = $id_user;
        

        if ($reservasi->save() === false) {
            foreach ($reservasi->getMessages() as $message) {
                echo $message, "\n";
            }
        } else {
            $this->response->redirect('reservasi');
        }
    }

    public function destroyAction()
    {
        $id = $this->request->getPost('id');
        
        $reservasi = Reservasi::findFirst("id = '$id'");

        if ($reservasi !== false) {
            if ($reservasi->delete() === false) {
                echo "Sorry, we can't delete the reservation right now: \n";
        
                $messages = $reservasi->getMessages();
        
                foreach ($messages as $message) {
                    echo $message, "\n";
                }
            } else {
                $this->response->redirect('daftar-reservasi');
            }
        }
    }

    public function showAction()
    {
        if($this->session->get('auth')['status'] != '0'){
              $this->response->redirect();
        }
        
        $id = $this->session->get('auth')['id'];

    
        $results = Reservasi::find("id_user = '$id' ");
        $this->view->results = $results;
        

    }

}

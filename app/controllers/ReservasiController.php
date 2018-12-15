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
        if($searchBy == 'id_reservasi'){
           // $searchKey= '%'.$searchKey.'%';
            
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.nama, p.id_buku, b.judul FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND p.id = :searchKey:');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);  
        }else if($searchBy == 'nama'){
             $searchKey= '%'.$searchKey.'%';
             
             $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.nama, p.id_buku, b.judul FROM Users u, Peminjaman p, Buku b
             WHERE u.id = p.id_user AND p.id_buku = b.id AND u.nama LIKE :searchKey:');
             $peminjamans  = $query->execute([
                 'searchKey' => $searchKey,
             ]);  
         }else if($searchBy == 'id_buku'){
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.nama, p.id_buku, b.judul FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND p.id_buku = :searchKey:');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);
         }else if($searchBy == 'judul'){
            $searchKey= '%'.$searchKey.'%';
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.nama, p.id_buku, b.judul FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND b.judul LIKE :searchKey:');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);
         }else {
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.nama, p.id_buku, b.judul FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND p.id_user = :searchKey:');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);
         }

         


        $this->view->peminjamans = $peminjamans;
        
        
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

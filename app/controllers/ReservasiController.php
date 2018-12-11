<?php
use Phalcon\Mvc\Controller;
class ReservasiController extends BaseController
{

	public function manageAction()
    {
        if($this->session->get('auth')['status'] != '1'){
            $this->response->redirect();
        }

        $id_buku = $this->request->getPost('id_buku');
        $id_buku= '%'.$id_buku.'%';
        $reserve = Reservasi::find(
            [
                'conditions' => "id_buku LIKE :id_buku:" ,
                'bind'       => [
                    'id_buku' => $id_buku,
                ]
            ]
        );
        
        $this->view->reserve = $reserve;
    }

    public function createAction()
    {
        
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
    
    }

}

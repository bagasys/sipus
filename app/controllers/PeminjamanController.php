<?php
use Phalcon\Mvc\Controller;
class PeminjamanController extends BaseController
{
    public function manageAction()
    {
        if($this->session->get('auth')['status'] != '1'){
            $this->response->redirect();
        }

        $nama = $this->request->getPost('nama');
        $nama= '%'.$nama.'%';
        $peminjamans = Peminjaman::find(
            [
                'conditions' => "id LIKE :nama:" ,
                'bind'       => [
                    'nama' => $nama,
                ]
            ]
        );
        
        
        $this->view->peminjamans = $peminjamans;
    }

    public function createAction()
    {
        if($this->session->get('auth')['status'] != '1'){
            $this->response->redirect();
        }
    }

    public function showAction()
    {
        $id = $this->session->get('auth')['id'];

    
        $results = Peminjaman::find("id_user = '$id' ");
        $this->view->results = $results;


    }

    public function storeAction()
    {
        $id_buku = $this->request->getPost('id_buku');
        $book = Buku::findFirst("ISBN_ISSN = '$id_buku'");
        $sisa = $book->jumlah_tersedia;

        if($sisa > 0){

            $id_user = $this->request->getPost('id_user');
            $email = $this->request->getPost('email');
            $password = $this->request->getPost('password');
            $tgl_pinjam = $this->request->getPost('tgl_pinjam');
            $tgl_hrs_kembali = $this->request->getPost('tgl_hrs_kembali');
            $id_admin = 1;
            $status = "pinjam";

            $user = Users::findFirst("no_id = '$id_user'");

            if(password_verify($password, $user->password)){
                $pinjam = new Peminjaman();

                $pinjam->id_user = $id_user;
                $pinjam->id_buku = $id_buku;
                $pinjam->id_admin = $id_admin;
                $pinjam->tgl_pinjam = $tgl_pinjam;
                $pinjam->tgl_hrs_kembali = $tgl_hrs_kembali;
                $pinjam->status = $status;

                if($pinjam->save() === false){
                    foreach ($pinjam->getMessages() as $message) {
                        echo $message, "\n";
                    }                
                }
                else{
                    $this->response->redirect('daftar-peminjaman');
                }
            }
            else{
                $this->response->redirect('pinjam');
            }
        }
        else{
            $this->response->redirect('pinjam');
        }

    }

    public function destroyAction()
    {
        $id = $this->request->getPost('id');
        
        $peminjaman = Peminjaman::findFirst("id = '$id'");

        if ($peminjaman !== false) {
            if ($peminjaman->delete() === false) {
                echo "Sorry, we can't delete the loan right now: \n";
        
                $messages = $peminjaman->getMessages();
        
                foreach ($messages as $message) {
                    echo $message, "\n";
                }
            } else {
                $this->response->redirect('daftar-peminjaman');
            }
        }
    }
    
    public function returnAction()
    {
        $id = $this->request->getPost('id');
        
        $peminjaman = Peminjaman::findFirst("id = '$id'");

        
    }

}

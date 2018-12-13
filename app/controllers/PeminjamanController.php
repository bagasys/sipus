<?php
use Phalcon\Mvc\Controller;
//use Phalcon\Mvc\Model\Query;
class PeminjamanController extends BaseController
{
    public function manageAction()
    {
        if($this->session->get('auth')['status'] != '1'){
            $this->response->redirect();
        }

        //$query = $this->modelsManager->createQuery('SELECT u.nama, p.id_buku FROM Users u, Peminjaman p
        //WHERE u.id = p.id_user');
        //$users  = $query->execute();

        $query = $this->modelsManager->createQuery('SELECT p.id, p.id_user, u.id as wkwk, u.nama, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
        WHERE u.id = p.id_user AND p.id_buku = b.id AND p.id = 1');
        $peminjamans  = $query->execute();
        
        
        $nama = $this->request->getPost('nama');
        $nama= '%'.$nama.'%';
        // $peminjamans = Peminjaman::find(
        //     [
        //         'conditions' => "id LIKE :nama:" ,
        //         'bind'       => [
        //             'nama' => $nama,
        //         ]
        //     ]
        // );
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
            $date = date('Y-m-d');
            $datekembali = strftime("%Y-%m-%d", strtotime("$date +7 day"));          
            $id_admin = 1;
            $status = "pinjam";

            $user = Users::findFirst("no_id = '$id_user'");

            if(password_verify($password, $user->password)){
                $pinjam = new Peminjaman();

                $pinjam->id_user = $id_user;
                $pinjam->id_buku = $id_buku;
                $pinjam->id_admin = $id_admin;
                $pinjam->tgl_pinjam = $date;
                $pinjam->tgl_hrs_kembali = $datekembali;
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
    
    public function cobaAction()
    {
        if($this->session->get('auth')['status'] != '1'){
            $this->response->redirect();
        }

        

        // // Instantiate the Query
        // $query = new Query(
        //     'SELECT * FROM Users',
        //     $this->getDI()
        // );
        
        // // Execute the query returning a result if any
        // $users = $query->execute();
        
        //$query = $this->modelsManager->createQuery('SELECT u.nama,  FROM Users');
        $query = $this->modelsManager->createQuery('SELECT u.nama, p.id_buku FROM Users u, Peminjaman p
        WHERE u.id = p.id_user');
        $users  = $query->execute();
        
        // // With bound parameters
        // $query = $this->modelsManager->createQuery('SELECT * FROM Cars WHERE name = :name:');
        // $cars  = $query->execute(
        //     [
        //         'name' => 'Audi',
        //     ]
        // );

         $this->view->users = $users;




    }

   


    
    public function returnAction()
    {
        $id = $this->request->getPost('id');
        
        $peminjaman = Peminjaman::findFirst("id = '$id'");

        
    }

}

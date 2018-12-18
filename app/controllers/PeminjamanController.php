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

        $searchKey = $this->request->getPost('searchKey');
        $searchBy = $this->request->getPost('searchBy');
        $pinjamKey = $this->request->getPost('pinjamKey');
        $kembaliKey = $this->request->getPost('kembaliKey');
        $date = date('Y-m-d');

        if($searchBy == 'id_peminjaman'){
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND p.id = :searchKey:');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        } else if($searchBy == 'id_user'){
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND p.id_user = :searchKey: AND p.status != "selesai" ');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);

        } else if ($searchBy == 'nama'){
            $searchKey = '%'.$searchKey.'%';
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND u.nama LIKE :searchKey: AND p.status != "selesai" ');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        } else if ($searchBy == 'judul'){
            $searchKey = '%'.$searchKey.'%';
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND b.judul LIKE :searchKey: AND p.status != "selesai" ');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        } else if ($pinjamKey == 'tgl_pinjam'){
            $pinjamKey = '%'.$date.'%';
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND p.tgl_pinjam LIKE :searchKey: AND p.status != "selesai" ');
            $peminjamans  = $query->execute([
                'searchKey' => $pinjamKey,
            ]);
        } else if ($kembaliKey == 'tgl_hrs_kembali'){
            $kembaliKey = '%'.$date.'%';  
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND p.tgl_hrs_kembali LIKE :searchKey: AND p.status != "selesai" ');
            $peminjamans  = $query->execute([
                'searchKey' => $kembaliKey,
            ]);
        } else {
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND p.id_buku = :searchKey: AND p.status != "selesai" ');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        }
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
        $ISBN_ISSN = $this->request->getPost('ISBN_ISSN');
        $book = Buku::findFirst("ISBN_ISSN = '$ISBN_ISSN'");
        $sisa = $book->jumlah_tersedia;

        if($sisa > 0){
            $no_id = $this->request->getPost('no_id');
            $email = $this->request->getPost('email');
            $password = $this->request->getPost('password');
            $date = date('Y-m-d');
            $datekembali = strftime("%Y-%m-%d", strtotime("$date +7 day"));          
            $id_admin = 1;
            $status = "pinjam";
            $id_buku = $book->id;
            
            $user = Users::findFirst("no_id = '$no_id'");
            $id_user = $user->id;

            if(password_verify($password, $user->password)){
                $pinjam = new Peminjaman();

                $pinjam->id_user = $id_user;
                $pinjam->id_buku = $id_buku;
                $pinjam->id_admin = 2;
                $pinjam->tgl_pinjam = $date;
                $pinjam->tgl_hrs_kembali = $datekembali;
                $pinjam->status = $status;

                if($pinjam->save() === false){
                    foreach ($pinjam->getMessages() as $message) {
                        echo $message, "\n";
                    }                
                }
                else{
                    $sisa = $sisa - 1;

                    $sql = $this->modelsManager->createQuery('UPDATE Buku SET jumlah_tersedia = :jumlah_tersedia: WHERE id = :id_buku:');
                    $update = $sql->execute(
                    [
                        'jumlah_tersedia' => $sisa,
                        'id_buku' => $id_buku,
                    ]);  
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

        $date = date('Y-m-d');
        $query = $this->modelsManager->createQuery('SELECT id,tgl_hrs_kembali,status FROM Peminjaman WHERE tgl_hrs_kembali < :tgl:');
        $users = $query->execute(
            [
                'tgl' => $date,
            ]
        );
       
        foreach($users as $user){
            $tanggal = $user->tgl_hrs_kembali;
            $interval = (strtotime($date) - strtotime($tanggal)) / 86400;
            $denda = $interval * 5000;
            echo $interval;
            echo $user->status;
            if($denda > 0){
                $sql = $this->modelsManager->createQuery('UPDATE Peminjaman SET denda = :denda:, status = :stat: WHERE id = :id:');
                $update = $sql->execute(
                    [
                        'denda' => $denda,
                        'id' => $user->id,
                        'stat' => 'telat',
                    ]
                );  
            }
        }

    }


    public function returnAction()
    {
        //$id = $this->request->getPost('id');
        
        //$peminjaman = Peminjaman::findFirst("id = '$id'");

        $date = date('Y-m-d');
        $query = $this->modelsManager->createQuery('SELECT id,tgl_hrs_kembali,status FROM Peminjaman WHERE tgl_hrs_kembali < :tgl:');
        $users = $query->execute(
            [
                'tgl' => $date,
            ]
        );

        foreach($users as $user){
            $tanggal = $user->tgl_hrs_kembali;
            $interval = (strtotime($date) - strtotime($tanggal)) / 86400;
            $denda = $interval * 5000;
            echo $interval;
            echo $user->status;
            if($denda > 0){
                $sql = $this->modelsManager->createQuery('UPDATE Peminjaman SET denda = :denda:, status = :stat: WHERE id = :id:');
                $update = $sql->execute(
                    [
                        'denda' => $denda,
                        'id' => $user->id,
                        'stat' => 'telat',
                    ]
                );  
            }
        }
        //$this->response->redirect('daftar-peminjaman');

        $searchKey = $this->dispatcher->getParam("id");
        $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
        WHERE u.id = p.id_user AND p.id_buku = b.id AND p.id = :searchKey:');
        $peminjamans  = $query->execute([
            'searchKey' => $searchKey,
        ]);
            $this->view->peminjamans = $peminjamans;
    }
}
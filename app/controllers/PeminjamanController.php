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
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, u.no_id, b.ISBN_ISSN p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND p.id = :searchKey:');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        } else if($searchBy == 'no_id'){
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, u.no_id, b.ISBN_ISSN, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND u.no_id = :searchKey: AND p.status != "selesai" ');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        } else if ($searchBy == 'judul'){
            $searchKey = '%'.$searchKey.'%';
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, u.no_id, b.ISBN_ISSN, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND b.judul LIKE :searchKey: AND p.status != "selesai" ');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        } else if ($searchBy == 'ISBN_ISSN'){
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, u.no_id, b.ISBN_ISSN, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND b.ISBN_ISSN = :searchKey: AND p.status != "selesai" ');
            $peminjamans  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        } else if ($pinjamKey == 'tgl_pinjam'){
            $pinjamKey = '%'.$date.'%';
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, u.no_id, b.ISBN_ISSN, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND p.tgl_pinjam LIKE :searchKey: AND p.status != "selesai" ');
            $peminjamans  = $query->execute([
                'searchKey' => $pinjamKey,
            ]);
        } else if ($kembaliKey == 'tgl_hrs_kembali'){
            $kembaliKey = '%'.$date.'%';  
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, u.no_id, b.ISBN_ISSN, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND p.tgl_hrs_kembali LIKE :searchKey: AND p.status != "selesai" ');
            $peminjamans  = $query->execute([
                'searchKey' => $kembaliKey,
            ]);
        } else {
            $searchKey = '%'.$searchKey.'%';
            $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, u.no_id, b.ISBN_ISSN, p.id_buku, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam FROM Users u, Peminjaman p, Buku b
            WHERE u.id = p.id_user AND p.id_buku = b.id AND u.nama LIKE :searchKey: AND p.status != "selesai" ');
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
            if($sisa == 1){
                $sql = $this->modelsManager->createQuery('UPDATE Buku SET status = :stat: WHERE id = :id:');
                $update = $sql->execute(
                    [
                        'id' => $book->id,
                        'stat' => 'bisa',
                    ]
                );
            }

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
        
        $query = $this->modelsManager->createQuery('SELECT b.jumlah_tersedia as jumter, b.ISBN_ISSN as idb FROM Peminjaman p, Buku b
        WHERE p.id_buku = b.id AND p.id = :searchKey:');
        $jumlahtersedia  = $query->execute([
            'searchKey' => $id,
        ]);

        $tersedia = 0;
        $id_buku = 0;
        foreach($jumlahtersedia as $jumlahter){
            $tersedia = $jumlahter->jumter;
            $tersedia = $tersedia + 1;
            $id_buku = $jumlahter->idb;
        }
        
        $sql = $this->modelsManager->createQuery('UPDATE Buku SET jumlah_tersedia = :tersedia: WHERE ISBN_ISSN = :id_buku:');
            $update = $sql->execute(
                [
                    'id_buku' => $id_buku,
                    'tersedia' => $tersedia,
                ]
        );
        

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
        
        $jumlah_record = 0;
                 
        $sql = $this->modelsManager->createQuery('SELECT COUNT(id_user) as total FROM Reservasi WHERE id_buku = :id_buku:  AND status = :status: ORDER BY tgl_reservasi');
        $results = $sql->execute(
            [
                'id_buku' => 8,
                'status' => 'menunggu buku'
            ]
        );
        
        foreach($results as $result){
            $jumlah_record = $result->total;
            //echo $buku->total;
        }

        echo $jumlah_record . "<br>";
    
        if($jumlah_record >= 1){
            $sql = $this->modelsManager->createQuery('SELECT * FROM Reservasi WHERE id_buku = :id_buku: AND status = :status: ORDER BY tgl_reservasi LIMIT 1');
            $reservasi = $sql->execute(
                [
                    'id_buku' => 8,
                    'status' => 'menunggu buku',
                ]
            );
            $status_reservasi =  ' ';
            $id_user = 0;
            $id_reservasi = 0;

            foreach($reservasi as $reserve){
                //echo $buku->id_user;
                $id_user = $reserve->id_user;
                $status_reservasi = $reserve->status;
                $id_reservasi = $reserve->id;
            }
                     
        }
    }


    public function returnAction()
    {
        //$id = $this->request->getPost('id');
        
        //$peminjaman = Peminjaman::findFirst("id = '$id'");

        $date = date('Y-m-d');
        $searchKey = $this->dispatcher->getParam("id");

        $query = $this->modelsManager->createQuery('SELECT tgl_hrs_kembali, status FROM Peminjaman WHERE id = :id:');
        $users = $query->execute(
            [
                'id' => $searchKey
            ]
        );

        foreach($users as $user){
            $tanggal = $user->tgl_hrs_kembali;
            $interval = (strtotime($date) - strtotime($tanggal)) / 86400;
            $denda = $interval * 5000;
            $status = $user->status;
            echo $interval;
            echo $user->status;
            if($denda <= 0){
                  $denda = 0;
                  $status = 'terlambat';
            }

            $sql = $this->modelsManager->createQuery('UPDATE Peminjaman SET denda = :denda:, status = :stat:, tgl_kembali = :tgl: WHERE id = :id:');
                $update = $sql->execute(
                    [
                        'denda' => $denda,
                        'id' => $searchKey,
                        'stat' => $status,
                        'tgl' => $date,
                    ]
                );
        }
        //$this->response->redirect('daftar-peminjaman');

        $query = $this->modelsManager->createQuery('SELECT p.id as idp, p.id_user, u.id, u.nama, u.no_id, p.id_buku, b.ISBN_ISSN, b.jumlah_tersedia, b.judul, p.status, p.tgl_hrs_kembali, p.denda, p.tgl_pinjam, p.tgl_kembali FROM Users u, Peminjaman p, Buku b
        WHERE u.id = p.id_user AND p.id_buku = b.id AND p.id = :searchKey:');
        $peminjamans  = $query->execute([
            'searchKey' => $searchKey,
        ]);

        $this->view->peminjamans = $peminjamans;
        
        // $query = $this->modelsManager->createQuery('SELECT b.jumlah_tersedia as jumter FROM Peminjaman p, Buku b
        // WHERE p.id_buku = b.id AND p.id = :searchKey:');
        // $jumlahtersedia  = $query->execute([
        //     'searchKey' => $searchKey,
        // ]);
        // $tersedia = 0;
        // foreach($jumlahtersedia as $jumlahter){
        //     $tersedia = $jumlahter->jumter;
        // }

        if($this->request->isPost()){
            // $this->response->redirect('');
             $id = $this->request->getPost('id');
             $ISBN_ISSN = $this->request->getPost('id_buku');
             
             $buku = Buku::findFirst("ISBN_ISSN = '$ISBN_ISSN'");
             $tersedia = $buku->jumlah_tersedia + 1;
             $id_buku = $buku->id;
 
             $sql = $this->modelsManager->createQuery('UPDATE Peminjaman SET status = :stat: WHERE id = :id:');
                 $update = $sql->execute(
                     [
                         'id' => $id,
                         'stat' => 'Selesai',
                     ]
                 );
 
             $sql = $this->modelsManager->createQuery('UPDATE Buku SET jumlah_tersedia = :tersedia: WHERE ISBN_ISSN = :ISBN_ISSN:');
                 $update = $sql->execute(
                     [
                         'ISBN_ISSN' => $ISBN_ISSN,
                         'tersedia' => $tersedia,
                     ]
                 );
 
                 $sql = $this->modelsManager->createQuery('UPDATE Buku SET status = :stat: WHERE id = :id:');
                 $update = $sql->execute(
                     [
                         'id' => $id_buku,
                         'stat' => 'tidak',
                     ]
                     );


             
             
             $jumlah_record = 0;
                 
             $sql = $this->modelsManager->createQuery('SELECT COUNT(id_user) as total FROM Reservasi WHERE id_buku = :id_buku: AND status = :status: ORDER BY tgl_reservasi');
             $results = $sql->execute(
                 [
                     'id_buku' => $id_buku,
                     'status' => 'wait'
                 ]
             );
             
             foreach($results as $result){
                 $jumlah_record = $result->total;
             }
         
             if($jumlah_record >= 1){
                 $sql = $this->modelsManager->createQuery('SELECT * FROM Reservasi WHERE id_buku = :id_buku: AND status = :status: ORDER BY tgl_reservasi LIMIT 1');
                 $reservasi = $sql->execute(
                     [
                         'id_buku' => $id_buku,
                         'status' => 'wait',
                     ]
                 );
                 $status_reservasi =  ' ';
                 $id_user = 0;
                 $id_reservasi = 0;
 
                 foreach($reservasi as $reserve){
                     //echo $buku->id_user;
                     $id_user = $reserve->id_user;
                     $status_reservasi = $reserve->status;
                     $id_reservasi = $reserve->id;
                 }
 
                 $user = Users::findFirst("id = '$id_user'");
 
                 //////////
                 
                 $sql = $this->modelsManager->createQuery('UPDATE Reservasi SET status = :stat: WHERE id = :id_reservasi:');
                 $update = $sql->execute(
                     [
                         'id_reservasi' => $id_reservasi,
                         'stat' => 'ready',
                     ]
                     );
                 
                 /////////
             }else{
                 
             }
             $this->response->redirect("daftar-peminjaman");
         } 
    }
}
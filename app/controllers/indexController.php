<?php
use Phalcon\Mvc\Controller;
class IndexController extends BaseController
{
    public function show404Action()
    {
        
    }

    public function indexAction()
    {   
        
    }

    public function indexAdminAction()
    {
        if($this->session->get('auth')['status'] != '1'){
            $this->response->redirect();
        }
        
    }
    
    public function showBooksAction()
    {   
        $searchKey =  $this->request->getPost('searchKey');
        $searchBy =  $this->request->getPost('searchBy');
        $this->view->test = $searchKey;
        if($searchBy == 'penerbit'){ 
            $searchKey = '%'.$searchKey.'%';
            $query = $this->modelsManager->createQuery('SELECT * FROM Buku
            WHERE penerbit LIKE :searchKey:');
            $results  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        }else if($searchBy == 'pengarang'){ 
            $searchKey = '%'.$searchKey.'%';
            $query = $this->modelsManager->createQuery('SELECT * FROM Buku
            WHERE pengarang LIKE :searchKey:');
            $results  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        }else if($searchBy == 'ISBN_ISSN'){ 
            $query = $this->modelsManager->createQuery('SELECT * FROM Buku
            WHERE ISBN_ISSN = :searchKey:');
            $results  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        }else if($searchBy == 'kategori'){ 
            $searchKey = '%'.$searchKey.'%';
            $query = $this->modelsManager->createQuery('SELECT * FROM Buku
            WHERE kategori LIKE :searchKey:');
            $results  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        }else{
            $searchKey = '%'.$searchKey.'%';
            $query = $this->modelsManager->createQuery('SELECT * FROM Buku
            WHERE judul LIKE :searchKey:');
            $results  = $query->execute([
                'searchKey' => $searchKey,
            ]);
        }


        $this->view->results = $results;
    }

    public function showBookDetailAction()
    {   
        $id = $this->dispatcher->getParam("id");
        $results = Buku::findFirst("id = '$id' ");
        $this->view->results = $results;
        $jumlah_tersedia = $results->jumlah_tersedia;
        //$reser
        $jumlah_record = 0;

        $sql = $this->modelsManager->createQuery('SELECT COUNT(id_user) as total FROM Reservasi WHERE id_buku = :id: ORDER BY tgl_reservasi');
        $counts = $sql->execute(
            [
                'id' => $id,
            ]
        );
        
        foreach($counts as $count){
            $jumlah_record = $count->total;
            echo $count->total;
        }

        //$results = Buku::findFirst("id = '$id' ");
        echo $results->status;

 

       

        

        $reservasi_wait = 0;
                 
        $sql = $this->modelsManager->createQuery('SELECT COUNT(id_user) as total FROM Reservasi WHERE id_buku = :id_buku: AND status = :status:');
        $results = $sql->execute(
            [
                'id_buku' => $id,
                'status' => 'wait'
            ]
        );
        
        foreach($results as $result){
            $reservasi_wait = $result->total;
        }

        //echo "reservasi_wait: " . $reservasi_wait;
        //

        //
        $jumlah_tersedia = 0;
        $jumlah = 0;

        $query = $this->modelsManager->createQuery('SELECT jumlah_tersedia, jumlah FROM Buku
        WHERE id = :searchKey:');
        $results  = $query->execute([
            'searchKey' => $id,
        ]);
        
        foreach($results as $result){
            $jumlah_tersedia = $result->jumlah_tersedia;
            $jumlah = $result->jumlah;
        }

       // echo "jumlah_tersedia: " . $jumlah_tersedia;
       // echo "jumlah: " . $jumlah;
        //

        //
        $reservasi_ready = 0;
                 
        $sql = $this->modelsManager->createQuery('SELECT COUNT(id_user) as total FROM Reservasi WHERE id_buku = :id_buku: AND status = :status:');
        $results = $sql->execute(
            [
                'id_buku' => $id,
                'status' => 'ready'
            ]
        );
        
        foreach($results as $result){
            $reservasi_ready = $result->total;
        }

        //echo "reservasi_ready: " . $reservasi_ready;
        //

        if ($jumlah_tersedia - $reservasi_ready <= 0 && $reservasi_wait + $reservasi_ready < $jumlah){
            echo "haha";
        }

        $flag = 1;

         if($jumlah_tersedia - $reservasi_ready <= 0 && $reservasi_wait + $reservasi_ready < $jumlah){
             $flag = 0;
        }

        // if($results->status === 'bisa' && $jumlah_record < $results->jumlah){
        //     $flag = 0;
        //}





        echo $flag;
        $this->view->flag = $flag;
        
    }

}

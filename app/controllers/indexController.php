<?php
use Phalcon\Mvc\Controller;
class IndexController extends BaseController
{
    public function show404Action()
    {
        
    }

    public function indexAction()
    {   
       /* if(!isset($_COOKIE["akses"])) {
            // $cookie_name = "akses";
            // $cookie_value = 1;
            // setcookie($cookie_name, $cookie_value, time() + (86400), "/");
            //$date = date('Y-m-d');
            //query
            //$query = $this->modelsManager->createQuery('SELECT tgl_hrs_kembali FROM Peminjaman');
            //$tgl_hrs_kembali = $query->execute();
            //echo $tgl_hrs_kembali;
        } else {
            
        }*/

        
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
        }else if($searchBy == 'id_buku'){ 
            $query = $this->modelsManager->createQuery('SELECT * FROM Buku
            WHERE id = :searchKey:');
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


    public function searchBooksAction()
    {
        

        //$this->response->redirect("catalogue");
    }

    public function showBookDetailAction()
    {   
        $id = $this->dispatcher->getParam("id");
        $results = Buku::findFirst("id = '$id' ");
        $this->view->results = $results;
    }

}

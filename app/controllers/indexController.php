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
        $judul = $this->request->getPost('title');
        $judul = '%'.$judul.'%';
        $results = Buku::find(
            [
                'conditions' => "judul LIKE :judul:" ,
                'bind'       => [
                    'judul' => $judul,
                ]
            ]
        );
        
        
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

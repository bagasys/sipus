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
    
    }

}

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
        $results = Buku::find();
        $this->view->results = $results;
    }

    public function showBookDetailAction()
    {   
    
    }

}

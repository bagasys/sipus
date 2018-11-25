<?php
use Phalcon\Mvc\Controller;
class IndexController extends BaseController
{
    public function show404Action()
    {   
        echo "Maaf URL tidak valid";
        die();
    }

    public function indexAction()
    {   
    
    }
}
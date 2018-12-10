<?php
use Phalcon\Mvc\Controller;
class PeminjamanController extends BaseController
{
    public function manageAction()
    {
        if($this->session->has('auth')){
            $this->response->redirect();
        }
    }

    public function createAction()
    {
        if($this->session->has('auth')){
            $this->response->redirect();
        }
    }

    public function showAction()
    {
    
    }

    public function storeAction()
    {
    
    }

    public function destroyAction()
    {
    
    }
    
}

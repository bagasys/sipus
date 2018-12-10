<?php
use Phalcon\Mvc\Controller;
class PeminjamanController extends BaseController
{
    public function manageAction()
    {
        if($this->session->get('auth')['status'] === '0'){
            $this->response->redirect();
        }
    }

    public function createAction()
    {
        if($this->session->get('auth')['status'] === '0'){
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

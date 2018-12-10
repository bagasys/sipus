<?php
use Phalcon\Mvc\Controller;
class ReservasiController extends BaseController
{

	public function manageAction()
    {
        
    }

    public function createAction()
    {
        
    }

    public function destroyAction()
    {
        
    }

    public function showAction()
    {
        //if($this->session->get('auth')['status'] != '0'){
         //   $this->response->redirect();
        //}
        
        $id = $this->session->get('auth')['id'];

    
        $results = Reservasi::find("id_user = '$id' ");
        $this->view->results = $results;
        

    }

}

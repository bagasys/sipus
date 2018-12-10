<?php
use Phalcon\Mvc\Controller;
class PeminjamanController extends BaseController
{
    public function manageAction()
    {
        if($this->session->get('auth')['status'] != '1'){
            $this->response->redirect();
        }

        $nama = $this->request->getPost('nama');
        $nama= '%'.$nama.'%';
        $peminjamans = Peminjaman::find(
            [
                'conditions' => "id LIKE :nama:" ,
                'bind'       => [
                    'nama' => $nama,
                ]
            ]
        );
        
        
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
    
    }

    public function storeAction()
    {
    
    }

    public function destroyAction()
    {
    
    }
    
}

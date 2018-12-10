<?php
use Phalcon\Mvc\Controller;
class UsersController extends BaseController
{
    public function manageAction()
    {
        if(!$this->session->has('admin')){
            $this->response->redirect();
        }
    }
    public function createAction()
    {
        if(!$this->session->has('admin')){
            $this->response->redirect();
        }
    }
    public function editAction()
    {
        if(!$this->session->has('admin')){
            $this->response->redirect();
        }
    }

    public function storeAction()
    {
        $user = new Users();

        $nama = $this->request->getPost('nama');
        $alamat = $this->request->getPost('alamat');
        $telp = $this->request->getPost('telp');
        $no_id = $this->request->getPost('no_id');
        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');
        $cpassword = $this->request->getPost('cpassword');
        $admin = 0;

        if($password === $cpassword){
            $checkUser = Users::findFirst("email = '$email'");
            if($checkUser){
                $this->response->redirect('tambah-anggota');
            }
            else{
                $password = password_hash($password, PASSWORD_DEFAULT); 
                $user->nama = $nama;
                $user->email = $email;
                $user->password = $password;
                $user->alamat = $alamat;
                $user->no_telepon = $telp;
                $user->no_id = $no_id;
                $user->admin = $admin;

                $user->save();

                if($user->save() === false){
                    foreach ($user->getMessages() as $message) {
                        echo $message, "\n";
                    }                
                }
                else{
                    $this->response->redirect('login');
                }
            }
        }
        else{
            $this->response->redirect('tambah-anggota');
        }
        
    }
    public function updateAction()
    {
    
    }
    public function destroyAction()
    {
        
    }
}

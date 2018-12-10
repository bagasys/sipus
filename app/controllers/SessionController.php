<?php
use Phalcon\Mvc\Controller;
class SessionController extends BaseController
{
    public function createAction()
    {
        if($this->session->get('auth')['status'] === '0'){
            $this->response->redirect('daftar-buku');
        }
        else{
            $this->response->redirect();
        }
    }

    public function storeAction()
    {
    	$email = $this->request->getPost('email');
        $password = $this->request->getPost('password');
        $user = Users::findFirst("email='$email'");

        if($user)
        {
            if(password_verify($password, $user->password)){
                // if($user->admin === '1'){
                //     $this->session->set(
                //         'admin',
                //         [
                //             'status' => $user->admin,
                //             'nama' => $user->nama,
                //         ]
                //     );
                // }
                // else{
                    $this->session->set(
                        'auth',
                        [
                            'status' => $user->admin,
                            'nama' => $user->nama,
                        ]
                    );
                // }
                $this->response->redirect();
            }
            else{
                $this->response->redirect('login');
            }
        }
        else{
            $this->response->redirect('login');
        }
    }

    public function destroyAction()
    {
        $this->session->destroy();
        $this->response->redirect();
    }

    public function showAction(){
        
    }

}
   
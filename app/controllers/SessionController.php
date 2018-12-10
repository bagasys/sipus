<?php
use Phalcon\Mvc\Controller;
class SessionController extends BaseController
{
    public function createAction()
    {
    
    }

    public function storeAction()
    {
    	$email = $this->request->getPost('email');
        $password = $this->request->getPost('password');
        $user = Users::findFirst("email='$email'");

        if($user)
        {
            if($password === $user->password){
                $this->session->set(
                        'auth',
                        [
                            'status' => $user->admin,
                            'nama' => $user->nama,
                        ]
                );

                $this->response->redirect();
            }
        }

    }

    public function destroyAction()
    {
    
    }

}
   
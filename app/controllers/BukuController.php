<?php
use Phalcon\Mvc\Controller;
class BukuController extends BaseController
{
    public function manageAction()
    {
        if($this->session->has('auth')){
            $this->response->redirect();
        }
        $results = Buku::find();
        $this->view->results = $results;
    }

    public function createAction()
    {
        if($this->session->has('auth')){
            $this->response->redirect();
        }
        $results = Buku::find();
        $this->view->results = $results;
    }
    
    public function editAction()
    {   
        if($this->session->has('auth')){
            $this->response->redirect();
        }
        $id = $this->dispatcher->getParam("id");
        $results = Buku::findFirst("id = '$id' ");
        $this->view->results = $results;
    }

    public function storeAction()
    {
        $book = new Buku();

        $isbn = $this->request->getPost('ISBN_ISSN');
        $judul = $this->request->getPost('judul');
        $pengarang = $this->request->getPost('pengarang');
        $kategori = $this->request->getPost('kategori');
        $penerbit = $this->request->getPost('penerbit');
        $deskripsi = $this->request->getPost('deskripsi');
        $deskripsi_fisik = $this->request->getPost('deskripsi_fisik');
        $nomor_panggil = $this->request->getPost('nomor_panggil');

       

        $book->ISBN_ISSN = $isbn;
        $book->judul = $judul;
        $book->pengarang = $pengarang;
        $book->kategori = $kategori;
        $book->penerbit = $penerbit;
        $book->deskripsi = $deskripsi;
        $book->deskripsi_fisik = $deskripsi_fisik;
        $book->nomor_panggil = $nomor_panggil;

        

        if ($book->save() === false) {
            foreach ($book->getMessages() as $message) {
                echo $message, "\n";
            }
        } else {
            echo "pendaftaran sukses";
        }
    }
    
    public function updateAction()
    {   
        
        
        $id = $this->request->getPost('id');
        $isbn = $this->request->getPost('ISBN_ISSN');
        $judul = $this->request->getPost('judul');
        $pengarang = $this->request->getPost('pengarang');
        $kategori = $this->request->getPost('kategori');
        $penerbit = $this->request->getPost('penerbit');
        $deskripsi = $this->request->getPost('deskripsi');
        $deskripsi_fisik = $this->request->getPost('deskripsi_fisik');
        $nomor_panggil = $this->request->getPost('nomor_panggil');


        $book = Buku::findFirst("id = '$id'");
        $book->ISBN_ISSN = $isbn;
        $book->judul = $judul;
        $book->pengarang = $pengarang;
        $book->kategori = $kategori;
        $book->penerbit = $penerbit;
        $book->deskripsi = $deskripsi;
        $book->deskripsi_fisik = $deskripsi_fisik;
        $book->nomor_panggil = $nomor_panggil;

        
        
        if ($book->save() === false) {
            foreach ($book->getMessages() as $message) {
                echo $message, "\n";
            }
        } else {
            echo "pendaftaran sukses";
        }
    }
    
    public function destroyAction()
    {   
        $id = $this->request->getPost('id');
        echo "$id";
        
        
        $robot = Buku::findFirst("id = '$id'");

        if ($robot !== false) {
            if ($robot->delete() === false) {
                echo "Sorry, we can't delete the robot right now: \n";
        
                $messages = $robot->getMessages();
        
                foreach ($messages as $message) {
                    echo $message, "\n";
                }
            } else {
                echo 'The robot was deleted successfully!';
            }
        }


    }

}

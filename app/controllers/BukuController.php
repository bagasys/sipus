<?php
use Phalcon\Mvc\Controller;
class BukuController extends BaseController
{
    public function manageAction()
    {
        $results = Buku::find();
        $this->view->results = $results;
    }

    public function createAction()
    {
    
    }
    
    public function editAction()
    {
    
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
    
    }
    
    public function destroyAction()
    {
    
    }

}

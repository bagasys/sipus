<?php
use Phalcon\Mvc\Controller;
class BukuController extends BaseController
{
    public function manageAction()
    {
        if($this->session->get('auth')['status'] != '1'){
            $this->response->redirect();
        }

        // $searchKey = $this->request->getPost('searchKey');
        // $searchBy = $this->request->getPost('searchBy');

        // if($searchBy == 'judul'){
        //     $searchKey = '%'.$searchKey.'%';
        //     $query = $this->modelsManager->createQuery('SELECT * FROM Buku WHERE judul LIKE :searchKey:');
        //     $bukus  = $query->execute([
        //         'searchKey' => $searchKey,
        //     ]);
        // }

        // $this->view->results = $bukus;
        
        // $judul = $this->request->getPost('title');
        // $judul = '%'.$judul.'%';
        // $results = Buku::find(
        //     [
        //         'conditions' => "judul LIKE :judul:" ,
        //         'bind'       => [
        //             'judul' => $judul,
        //         ]
        //     ]
        // );

        $searchKey =  $this->request->getPost('searchKey');
        $searchBy =  $this->request->getPost('searchBy');
            if($searchBy == 'pengarang'){ 
                $searchKey = '%'.$searchKey.'%';
                $query = $this->modelsManager->createQuery('SELECT * FROM Buku
                WHERE pengarang LIKE :searchKey:');
                $results  = $query->execute([
                    'searchKey' => $searchKey,
                ]);
            }else if($searchBy == 'ISBN_ISSN'){ 
                $query = $this->modelsManager->createQuery('SELECT * FROM Buku
                WHERE ISBN_ISSN = :searchKey:');
                $results  = $query->execute([
                    'searchKey' => $searchKey,
                ]);
            }else if($searchBy == 'kategori'){ 
                $searchKey = '%'.$searchKey.'%';
                $query = $this->modelsManager->createQuery('SELECT * FROM Buku
                WHERE kategori LIKE :searchKey:');
                $results  = $query->execute([
                    'searchKey' => $searchKey,
                ]);
            }else if($searchBy == 'penerbit'){ 
                $searchKey = '%'.$searchKey.'%';
                $query = $this->modelsManager->createQuery('SELECT * FROM Buku
                WHERE penerbit LIKE :searchKey:');
                $results  = $query->execute([
                    'searchKey' => $searchKey,
                ]);
            }else{ 
                $searchKey = '%'.$searchKey.'%';
                $query = $this->modelsManager->createQuery('SELECT * FROM Buku
                WHERE judul LIKE :searchKey:');
                $results  = $query->execute([
                    'searchKey' => $searchKey,
                ]);
            }        
        
        $this->view->results = $results;
    }

    public function createAction()
    {
        if($this->session->get('auth')['status'] != '1'){
            $this->response->redirect();
        }

        $book = new Buku();

        $isbn = $this->request->getPost('ISBN_ISSN');
        $judul = $this->request->getPost('judul');
        $pengarang = $this->request->getPost('pengarang');
        $kategori = $this->request->getPost('kategori');
        $penerbit = $this->request->getPost('penerbit');
        $deskripsi = $this->request->getPost('deskripsi');
        $deskripsi_fisik = $this->request->getPost('deskripsi_fisik');
        $nomor_panggil = $this->request->getPost('nomor_panggil');
        $jumlah = $this->request->getPost('jumlah');

        $path ='books/'.$isbn.'.jpg';
        if ($this->request->hasFiles()) {
            $gambar = $this->request->getUploadedFiles()[0];
            $gambar->moveTo($path);
        }

        $book->ISBN_ISSN = $isbn;
        $book->judul = $judul;
        $book->pengarang = $pengarang;
        $book->kategori = $kategori;
        $book->penerbit = $penerbit;
        $book->deskripsi = $deskripsi;
        $book->deskripsi_fisik = $deskripsi_fisik;
        $book->nomor_panggil = $nomor_panggil;
        $book->jumlah = $jumlah;
        $book->jumlah_tersedia = $jumlah;
        $book->gambar_buku = $path;
        $this->view->status = "";
    

        if ($book->save() === false) {
            foreach ($book->getMessages() as $message) {
                echo $message, "\n";
            }
        } else {
            $this->response->redirect('daftar-buku');
//            $this->view->   status = "pendaftaran sukses";
        }


        // $results = Buku::find();
        // $this->view->results = $results;
    }
    
    public function editAction()
    {   
        if($this->session->get('auth')['status'] != '1'){
            $this->response->redirect();
        }
        $id = $this->dispatcher->getParam("id");
        $results = Buku::findFirst("id = '$id' ");
        $this->view->results = $results;
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
        $jumlah = $this->request->getPost('jumlah');    
        $jumlah_tersedia = $this->request->getPost('jumlah_tersedia');

        $path = 'books/'.$isbn.'.jpg';
        if ($this->request->hasFiles()) {
            $gambar = $this->request->getUploadedFiles()[0];
            $gambar->moveTo($path);
        }

        $book = Buku::findFirst("id = '$id'");
        $book->ISBN_ISSN = $isbn;
        $book->judul = $judul;
        $book->pengarang = $pengarang;
        $book->kategori = $kategori;
        $book->penerbit = $penerbit;
        $book->deskripsi = $deskripsi;
        $book->deskripsi_fisik = $deskripsi_fisik;
        $book->nomor_panggil = $nomor_panggil;
        $book->jumlah = $jumlah;
        $book->jumlah_tersedia = $jumlah_tersedia;
        $book->gambar_buku = $path;
        
        if ($book->save() === false) {
            foreach ($book->getMessages() as $message) {
                echo $message, "\n";
            }
        } else {
            $this->response->redirect('daftar-buku');
        }
    }
    
    public function destroyAction()
    {   
        $id = $this->request->getPost('id');        
        
        $robot = Buku::findFirst("id = '$id'");

        if ($robot !== false) {
            if ($robot->delete() === false) {
                echo "Sorry, we can't delete the robot right now: \n";
        
                $messages = $robot->getMessages();
        
                foreach ($messages as $message) {
                    echo $message, "\n";
                }
            } else {
                $this->response->redirect('daftar-buku');            }
        }


    }

}

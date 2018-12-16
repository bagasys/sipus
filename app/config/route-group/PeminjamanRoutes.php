<?php

use \Phalcon\Mvc\Router\Group as RouterGroup;

class PeminjamanRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'peminjaman',
        ]);

        $this->addGet(
            '/daftar-peminjaman',
            [
                'action'    => 'manage',
            ]
        );
        $this->addPost(
            '/daftar-peminjaman',
            [
                'action'    => 'manage',
            ]
        );

        $this->addGet(
            '/pinjam',
            [
                'action'    => 'create',
            ]
        );

        $this->addGet(
            '/peminjaman',
            [
                'action'    => 'show',
            ]
        );
      
        $this->addPost(
            '/pinjam',
            [
                'action'    => 'store',
            ]
        );

        $this->addPost(
            '/hapus-peminjaman',
            [
                'action'    => 'destroy',
            ]
        );

        
       
        $this->addPost(
            '/kembalikan',
            [
                'action'    => 'return',
            ]
        );

        $this->addGet(
            '/kembalikan/{id}',
            [
                'action'    => 'return',
            ]
        );

        $this->addPost(
            '/coba',
            [
                'action'    => 'coba',
            ]
        );

        $this->addGet(
            '/coba',
            [
                'action'    => 'coba',
            ]
        );

    }
}
<?php

use \Phalcon\Mvc\Router\Group as RouterGroup;

class BukuRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'buku',
        ]);

        $this->addGet(
            '/daftar-buku',
            [
                'action'    => 'manage',
            ]
        );

        $this->addPost(
            '/daftar-buku',
            [
                'action'    => 'manage',
            ]
        );

        $this->addGet(
            '/tambah-buku',
            [
                'action'    => 'create',
            ]
        );

        $this->addGet(
            '/ubah-buku/{id}',
            [
                'action'    => 'edit',
            ]
        );

        $this->addPost(
            '/tambah-buku',
            [
                'action'    => 'create',
            ]
        );

        $this->addPost(
            '/ubah-buku',
            [
                'action'    => 'update',
            ]
        );

        $this->addPost(
            '/hapus-buku',
            [
                'action'    => 'destroy',
            ]
        );
       
        
    }
}       
<?php

use \Phalcon\Mvc\Router\Group as RouterGroup;

class SessionRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'peminjaman',
        ]);

        $this->addGet(
            '/pinjam',
            [
                'action' => 'create',
            ]
        );

        $this->addPost(
            '/pinjam',
            [
                'action' => 'store',
            ]
        );

    }
}
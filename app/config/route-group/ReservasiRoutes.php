<?php

use \Phalcon\Mvc\Router\Group as RouterGroup;

class ReservasiRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'reservasi',
        ]);

        $this->addGet(
            '/reservasi',
            [
                'action'    => 'show',
            ]
        );

        $this->addPost(
            '/reservasi',
            [
                'action'    => 'create',
            ]
        );
       
        $this->addPost(
            '/hapus-reservasi',
            [
                'action'    => 'destroy',
            ]
        );

    }
}
<?php

use \Phalcon\Mvc\Router\Group as RouterGroup;

class UserRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'user',
        ]);

        $this->addGet(
            '/signup',
            [
                'action' => 'create',
            ]
        );

        $this->addPost(
            '/signup',
            [
                'action' => 'store',
            ]
        );
    }
}
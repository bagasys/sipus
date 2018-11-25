<?php

$di->set(
    'router',
    function () {
        $router = new \Phalcon\Mvc\Router(false);

    

        $router->addGet(
            '/',
            [
                'controller'    => 'index',
                'action'        => 'index'
            ]
        );

        $router->notFound([
            'controller' => 'index',
            'action'     => 'show404'
        ]);

        

        return $router;

        
    }

    
);
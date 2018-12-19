<?php

use Phalcon\Config;

return new Config([
    'database' =>[
        'adapter' =>'Phalcon\Db\Adapter\Pdo\Mysql',
        'host' => '127.0.0.1',
        'username' => 'root',
        'password' =>'',
        'dbname' =>'sipus'
    ],
    'url' =>[
        'baseUrl' => 'http://localhost/sipus/'
    ]
]);

// return new Config([
//     'database' =>[
//         'adapter' =>'Phalcon\Db\Adapter\Pdo\Mysql',
//         'host' => '10.151.62.127',
//         'username' => 'user-pweb',
//         'password' =>'user-pweb1718',
//         'dbname' =>'pweb_f_7'
//     ],
//     'url' =>[
//         'baseUrl' => 'http://10.151.62.127/FP_PWEB_F/FP_PWEB_F/7/'
//     ]
// ]);
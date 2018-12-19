<?php

use Phalcon\Di\FactoryDefault;
use Phalcon\Mvc\Application;
use Phalcon\Db\Adapter\Pdo\Mysql as DBAdapter;


//menyalakan sistem error reporting pada phalcon untuk debugging
//error_reporting(E_ALL);
//ini_set('display_errors', 1);
//mengatur default Content-Type dan charset
header('Content-Type: text/html; charset:utf-8');
mb_internal_encoding("UTF-8");

//mendefinisikan BASE_PATH path ke folder project, APP_PATH path ke folder app
define('BASE_PATH', dirname(__DIR__));
define('APP_PATH', BASE_PATH . '\app');

//include class Bootstrap.php dan melakukan instansiasi, serta menjalankan fungsi init dari object tsb
require_once APP_PATH. '/Bootstrap.php';

$app = new Bootstrap();
$app->init();
<?php

use Phalcon\Di\FactoryDefault;
use Phalcon\Mvc\Application;
use Phalcon\Db\Adapter\Pdo\Mysql as DBAdapter;


//menyalakan sistem error reporting pada phalcon untuk debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);
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

/*echo "hai";

//Mencari record dengan id 4
$todo = Todos::findFirst(1);
//Mencetak "Minum"
$todo->content;

//Mencari record dengan id4
$todo = Todos::findFirst(1);

$todo->content = "Mengerjakan proyek web3";

$todo->save();
*/

// $todos = $this->modelsManager->executeQuery(
//     'SELECT * FROM Todos WHERE content = :content_body:',
//     [
//         'content_body' => "makan"
//     ]
// );

// foreach ($todos as $todo){
//     echo $todo->content."\n";
// }


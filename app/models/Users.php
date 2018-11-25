<?php

use Phalcon\Mvc\Model;

class Users extends Model
{
    public $id;
    public $nama;
    public $email;
    public $password;
    public $alamat;
    public $no_telepon;
    public $no_id;
    public $admin;

    public function initialize()
    {
        $this->hasMany(
            'id',
            'Reservasi',
            'id_user'
        );

        $this->hasMany(
            'id',
            'Peminjaman',
            'id_user'
        );
    }
}
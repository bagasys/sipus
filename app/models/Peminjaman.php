<?php

use Phalcon\Mvc\Model;

class Peminjaman extends Model
{
    public $id;
    public $id_user;
    public $id_buku;
    public $id_admin;
    public $tgl_pinjam;
    public $tgl_hrs_kembali;
    public $tgl_kembali;
    public $denda;
    public $status;

    public function initialize()
    {
        $this->belongsTo(
            'id_user',
            'Users',
            'id'
        );

        $this->belongsTo(
            'id_buku',
            'Buku',
            'id'
        );

        $this->belongsTo(
            'id_admin',
            'Users',
            'id'
        );
    }
}
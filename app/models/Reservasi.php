<?php

use Phalcon\Mvc\Model;

class Reservasi extends Model
{
    public $id;
    public $id_user;
    public $id_buku;
    public $tgl_reservasi;
    public $status;
    public $tgl_ready;

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
    }
}
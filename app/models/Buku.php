<?php
use Phalcon\Mvc\Model;

class Buku extends Model
{
    public $id;
    public $ISBN_ISSN;
    public $judul;
    public $pengarang;
    public $kategori;
    public $penerbit;
    public $deskripsi;
    public $deskripsi_fisik;
    public $nomor_panggil;
    public $gambar_buku;
    public $jumlah;
    public $jumlah_tersedia;
    public $status;

    public function initialize()
    {
        $this->hasMany(
            'id',
            'Reservasi',
            'id_buku'
        );

        $this->hasMany(
            'id',
            'Peminjaman',
            'id_buku'
        );
    }
}
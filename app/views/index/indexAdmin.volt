{% extends "layouts\base.volt" %}

{% block title %}
Librarian
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="ui huge header">
            Selamat datang di Area Pustakawan, {{ session.get('auth')['nama'] }}!
        </div>
    </div>
</div>
<div class="feature alternate ui stripe vertical segment">
    <div class="ui four column center aligned divided relaxed stackable grid container">
        <div class="row">
            <div class="column">
                <h2 class="ui icon header">
                    <i class="onHover user icon"></i>
                    Kelola Anggota
                </h2>
                <div style="padding-bottom: 5px;">
                    <a class="ui large brown button" href="daftar-anggota">Lihat Daftar Anggota</a>
                </div>
                <div>
                    <a class="ui large button" href="tambah-anggota">Daftarkan Anggota Baru</a>
                </div>
            </div>
            <div class="column">
                <h2 class="ui icon header">
                    <i class="onHover book icon"></i>
                    Kelola Buku
                </h2>
                <div style="padding-bottom: 5px;">
                    <a class="ui large brown button" href="daftar-buku">Lihat Daftar Buku</a>
                </div>
                <div>
                    <a class="ui large button" href="tambah-buku">Tambahkan Buku Baru</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="feature alternate ui stripe vertical segment">
    <div class="ui four column center aligned divided relaxed stackable grid container">
        <div class="row">
            <div class="column">
                <h2 class="ui icon header">
                    <i class="onHover tasks icon"></i>
                    Kelola Peminjaman
                </h2>
                <div style="padding-bottom: 5px;">
                    <a class="ui large brown button" href="daftar-peminjaman">Lihat Daftar Peminjaman</a>
                </div>
                <div>
                    <a class="ui large button" href="pinjam">Pinjamkan Buku kepada Anggota</a>
                </div>
            </div>
            <div class="column">
                <h2 class="ui icon header">
                    <i class="onHover bookmark icon"></i>
                    Kelola Reservasi
                </h2>
                <div>
                    <a class="ui large brown button" href="daftar-reservasi">Lihat Daftar Reservasi</a>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    .button {
        min-width: 250px;
    }
</style>
<script>
$(document).ready(function(){
    $('.onHover').hover(function(){
        $(this).transition({
            debug     : true,
            animation : 'bounce',
            duration  : 500,
            interval  : 200
        });
    }, function(){});

});
</script>
{% endblock %}
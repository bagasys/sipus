{% extends "layouts\base.volt" %}

{% block title %}
Area Pustakawan
{% endblock %}

{% block content %}
<div class="ui huge header">
    Selamat datang di Area Pustakawan, {{ session.get('auth')['nama'] }}!
</div>

<div class="ui inverted brown segment">
  <div class="ui three column very relaxed grid">
    <div class="column">
        <center>
            <div>
                <a href="daftar-anggota">Lihat Daftar Anggota</a>
            </div>
            <div>
                <a href="tambah-anggota">Daftarkan Anggota Baru</a>
            </div>
        </center>
    </div>
    <div class="column">
        <center>
            <div>
                <a href="daftar-buku">Lihat Daftar Buku</a>
            </div>
            <div>
                <a href="tambah-buku">Tambahkan Buku Baru</a>
            </div>
        </center>
    </div>
    <div class="column">
        <center>
            <div>
                <a href="daftar-peminjaman">Lihat Daftar Peminjaman</a>
            </div>
            <div>
                <a href="pinjam">Pinjamkan Buku kepada Anggota</a>
            </div>
        </center>
    </div>
  </div>
</div>
{% endblock %}
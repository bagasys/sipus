{% extends "layouts\base.volt" %}

{% block title %}
Daftar Peminjaman
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Daftar Peminjaman
        </div>
    </div>
</div>
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <a href="pinjam">Pinjam Buku</a>
    </div>
</div>
<form method="POST" action="{{ url("daftar-peminjaman") }}">
    <select name="searchBy" class="ui dropdown">
        <option value="nama">Nama Anggota</option>
        <option value="no_id">No ID Anggota</option>
        <option value="judul">Judul Buku</option>
        <option value="ISBN_ISSN">ISBN_ISSN</option>
        <option value="id_peminjaman">ID Peminjaman</option>
    </select>
    <div class="ui search item" style="display:inline-block;">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Cari peminjaman" name = "searchKey">
            <input class="circular ui brown icon button" type="submit" value="">
            <i class="search icon"></i>
        </div>
        <div class="results"></div>
    </div>
</form>
<form method="POST" action="{{ url("daftar-peminjaman") }}">
     <div class="ui search item">
        <div class="ui icon input">
            <input class="prompt" type="hidden" placeholder="Cari peminjaman" name = "pinjamKey" value="tgl_pinjam">
            <input class="circular ui brown icon button" type="submit" value="Pinjam Hari Ini">
            <i class="search icon"></i>
        </div>
        <div class="results"></div>
    </div>
</form>
<form method="POST" action="{{ url("daftar-peminjaman") }}">
    <div class="ui search item">
        <div class="ui icon input">
            <input class="prompt" type="hidden" placeholder="Cari peminjaman" name = "kembaliKey" value="tgl_hrs_kembali">
            <input class="circular ui brown icon button" type="submit" value="Deadline Hari Ini">
            <i class="search icon"></i>
        </div>
        <div class="results"></div>
    </div>
</form>
<table class="ui sortable selectable inverted brown celled table">
    <thead>
        <tr class="center aligned">
            <th>ID Peminjaman</th>
            <th>No ID Anggota</th>
            <th>Nama User</th>
            <th>ISBN_ISSN</th>
            <th>Judul Buku</th>
            <th>Tanggal Pinjam</th>
            <th>Tanggal Harus Kembali</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        {% for peminjaman in peminjamans %}
        <tr class="center aligned">
            <th>{{ peminjaman.idp }}</th>
            <th>{{ peminjaman.no_id}}</th>
            <th>{{ peminjaman.nama }}</th>
            <th>{{ peminjaman.ISBN_ISSN }}</th>
            <th>{{ peminjaman.judul }}</th>
            <th>{{ peminjaman.tgl_pinjam }}</th>
            <th>{{ peminjaman.tgl_hrs_kembali }}</th>
            <th>{{ peminjaman.status }}</th>
            <th>
                <form method="POST" action="{{url("hapus-peminjaman")}}" class="ui form">
                    <input type="hidden" name="id" value="{{peminjaman.idp}}">
                    <input type="submit" value="Hapus">
                </form>
                <div>
                    <a href="kembalikan/{{peminjaman.idp}}" class="ui labeled icon blue button">
                        <i class="edit icon"></i>
                        Kembalikan
                    </a>
				</div>
            </th>
        </tr>
       
        {% endfor %} 
    </tbody>
</table>
<script>
    $('.ui.dropdown')
        .dropdown();
    $("table")
        .tablesort();
</script>
{% endblock %}
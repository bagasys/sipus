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
    <div class="ui search item">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Cari peminjaman" name = "searchKey">
            <input class="circular ui brown icon button" type="submit" value="">
            <i class="search icon"></i>
        </div>
        <div class="results"></div>
    </div>
</form>
<table class="ui selectable inverted brown celled table">
    <thead>
        <tr class="center aligned">
            <th>ID Peminjaman</th>
            <th>ID User</th>
            <th>Nama User</th>
            <th>ID Buku</th>
            <th>Tanggal Pinjam</th>
            <th>Tanggal Harus Kembali</th>
            <th>Tanggal Kembali</th>
            <th>Denda</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        {% for peminjaman in peminjamans %}
         
        <tr class="center aligned">
            <th>{{ peminjaman.id }}</th>
            <th>{{ peminjaman.id_user}}</th>
            <th>{{peminjaman.nama}}</th>
            <th>{{ peminjaman.id_buku }}</th>
            <th>{{ peminjaman.tgl_pinjam }}</th>
            <th>{{ peminjaman.tgl_pinjam }}</th>
            <th>{{ peminjaman.tgl_hrs_kembali }}</th>
            <th>Rp. {{ peminjaman.denda }},-</th>
            <th>{{ peminjaman.status }}</th>
            <th>
                <form method="POST" action="{{url("hapus-peminjaman")}}" class="ui form">
                    <input type="hidden" name="id" value="{{peminjaman.id}}">
                    <input type="submit" value="Hapus">
                </form>
                <form method="POST" action="{{url("kembalikan")}}" class="ui form">
                    <input type="hidden" name="id" value="{{peminjaman.id}}">
                    <input type="submit" value="Kembalikan">
                </form>
            </th>
        </tr>
       
        {% endfor %} 
    </tbody>
</table>
{% endblock %}
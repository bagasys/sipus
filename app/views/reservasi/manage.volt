{% extends "layouts\base.volt" %}

{% block title %}
Daftar Reservasi
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Daftar Reservasi
        </div>
    </div>
</div>
<form method="POST" action="{{ url("daftar-reservasi") }}">
    <div class="ui search item">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Cari pada reservasi..." name = "searchKey">
            <input class="circular ui brown icon button" type="submit" value="">
            <i class="search icon"></i>
        </div>
        <div class="results"></div>
    </div>
    <br>
    <select name="searchBy" class="ui dropdown">
        <option value="nama">Nama Anggota</option>
        <option value="judul">Judul Buku</option>
        <option value="ISBN_ISSN">ISBN_ISSN</option>
        <option value="no_id">No ID Anggota</option>
        <option value="id_reservasi">ID Reservasi</option>
    </select>
    <div class="ui left pointing brown label">Advanced Search</div>
</form>
<br>
<form method="POST" action="{{ url("daftar-reservasi") }}">
    <div class="ui search item">
        <div class="ui icon input">
            <input class="prompt" type="hidden" name = "updateKey" value="update">
            <input class="circular ui red icon button" type="submit" value="Update">
            <i class="calendar check outline icon"></i>
        </div>
        <div class="results"></div>
    </div>
</form>
<table class="ui sortable selectable inverted brown celled table">
    <thead>
        <tr class="center aligned">
            <th>ID Reservasi</th>
            <th>No ID Anggota</th>
            <th>Nama User</th>
            <th>ISBN_ISSN</th>
            <th>Nama Buku</th>
            <th>Status</th>
            <th>Tanggal Ready</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        {% for peminjaman in peminjamans %} 
        <tr class="center aligned">
            <th>{{ peminjaman.idr }}</th>
            <th>{{ peminjaman.no_id }}</th>
            <th>{{ peminjaman.nama }}</th>
            <th>{{ peminjaman.ISBN_ISSN }}</th>
            <th>{{ peminjaman.judul }}</th>
            <th>{{ peminjaman.status }}</th>
            <th>{{ peminjaman.tgl_ready }}</th>
            <th>
                <button class="confirm ui labeled icon red button" data-id="{{peminjaman.idr}}" data-nama="{{peminjaman.nama}}" data-judul="{{peminjaman.judul}}">
                    <i class="trash alternate outline icon"></i>
                    Hapus
                </button>
            </th>
        </tr>
       
        {% endfor %} 
    </tbody>
</table>
<div class="ui mini test modal">
    <div class="header">
        Hapus Reservasi
    </div>
    <div class="content">
        <p>Apakah Anda yakin ingin menghapus reservasi buku <span id="confirm-judul"></span> oleh <span id="confirm-nama"></span>?</p>
    </div>
    <div class="actions">
        <div class="ui negative button">
            Tidak
        </div>
        <div style="display: inline-block;">
            <form method="POST" action="{{url("hapus-reservasi")}}" class="ui form">
                <input type="hidden" name="id" id="confirm-id">
                <button type="submit" class="ui positive right labeled icon button">
                    Ya
                    <i class="checkmark icon"></i>
                </button>
            </form>
        </div>
    </div>
</div>
<script>
    $(".confirm").click(function(){
        var id = $(this).data("id");
        var nama = $(this).data("nama");
        var judul = $(this).data("judul");
        $("#confirm-id").val(id);
        $("#confirm-nama").html(nama);
        $("#confirm-judul").html(judul);
        $('.mini.modal').modal('show');
    });
    $('.ui.dropdown')
        .dropdown();
    $("table")
        .tablesort();
</script>
{% endblock %}
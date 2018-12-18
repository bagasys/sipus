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
    <select name="searchBy" class="ui dropdown">
        <option value="nama">Nama Anggota</option>
        <option value="judul">Judul Buku</option>
        <option value="ISBN_ISSN">ISBN_ISSN</option>
        <option value="no_id">No ID Anggota</option>
        <option value="id_reservasi">ID Reservasi</option>
    </select>
    <div class="ui search item" style="display:inline-block;">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Cari Reservasi" name = "searchKey">
            <input class="circular ui brown icon button" type="submit" value="">
            <i class="search icon"></i>
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
            <th>
                <form method="POST" action="{{url("hapus-reservasi")}}" class="ui form">
                    <input type="hidden" name="id" value="{{peminjaman.idr}}">
                    <input type="submit" value="Hapus">
                </form> 
            </th>
        </tr>
       
        {% endfor %} 
    </tbody>
</table>
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
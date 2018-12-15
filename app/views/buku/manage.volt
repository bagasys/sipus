{% extends "layouts\base.volt" %}

{% block title %}
Daftar Buku
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Daftar Buku
        </div>
    </div>
</div>
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <a href="tambah-buku">Tambahkan Buku Baru</a>    
    </div>
</div>
<form method="POST" action="{{ url("daftar-buku") }}">
    <div class="ui search item">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Cari judul buku..." name = "title">
            <input class="circular ui brown icon button" type="submit" value="">
            <i class="search icon"></i>
        </div>
        <div class="results"></div>
    </div>
</form>
<table class="ui selectable inverted brown celled table">
    <thead>
        <tr class="center aligned">
            <th>ID</th>
            <th>ISBN / ISSN</th>
            <th>Judul</th>
            <th>Pengarang</th>
            <th>Penerbit</th>
            <th>Kategori</th>
            <th>Deskripsi</th>
            <th>Deskripsi Fisik</th>
            <th>Nomor Panggil</th>
            <th>Gambar Buku</th>
            <th>Jumlah</th>
            <th>Jumlah tersedia</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        {% for result in results %}
        <tr class="center aligned">
            <th>{{result.id}}</th>
            <th>{{result.ISBN_ISSN}}</th>
            <th>{{result.judul}}</th>
            <th>{{result.pengarang}}</th>
            <th>{{result.penerbit}}</th>
            <th>{{result.kategori}}</th>
            <th>{{result.deskripsi}}</th>
            <th>{{result.deskripsi_fisik}}</th>
            <th>{{result.nomor_panggil}}</th>
            <th>{{ image("img/sipus_logo.png") }}</th>
            <th>{{result.jumlah}}</th>
            <th>{{result.jumlah_tersedia}}</th>
            <th>{{result.status}}</th>
            <th>
                <div>
                    <a href="ubah-buku/{{result.id}}" class="ui labeled icon blue button">
                        <i class="edit icon"></i>
                        Edit
                    </a>
				</div>
                <button class="confirm ui labeled icon red button" data-id="{{result.id}}" data-nama="{{result.judul}}">
                    <i class="trash alternate icon"></i>
                    Hapus
                </button>
            </th>
        </tr>
        {% endfor %}
    </tbody>
</table>
<div class="ui mini test modal">
    <div class="header">
        Hapus Buku
    </div>
    <div class="content">
        <p>Apakah Anda yakin ingin menghapus <span id="confirm-nama"></span> dari koleksi perpustakaan?</p>
    </div>
    <div class="actions">
        <div class="ui negative button">
            Tidak
        </div>
        <div style="display: inline-block;">
            <form method="POST" action="{{url("hapus-buku")}}" class="ui form">
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
        $("#confirm-id").val(id);
        $("#confirm-nama").html(nama);
        $('.mini.modal').modal('show');
    });
</script>
{% endblock %}



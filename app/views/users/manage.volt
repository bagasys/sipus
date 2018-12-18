{% extends "layouts\base.volt" %}

{% block title %}
Daftar Anggota
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Daftar Anggota
        </div>
    </div>
</div>
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <a href="tambah-anggota">Daftarkan Anggota Baru</a>    
    </div>
</div>
<form method="POST" action="{{ url("daftar-anggota") }}">
    <select name="searchBy" class="ui dropdown">
        <option value="nama">Nama Anggota</option>
        <option value="no_id">Judul Buku</option>
        <option value="email">ID Buku</option>
        <option value="alamat">ID User</option>
        <option value="no_telepon">ID Reservasi</option>
    </select>
    <div class="ui search item">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Cari nama anggota..." name = "title">
            <input class="circular ui brown icon button" type="submit" value="">
            <i class="search icon"></i>
        </div>
        <div class="results"></div>
    </div>
</form>
<table class="ui sortable selectable inverted brown celled table">
    <thead>
        <tr class="center aligned">
            <th>ID</th>
            <th>Nama Lengkap</th>
            <th>Nomor Kartu Identitas</th>
            <th>Email</th>
            <th>Alamat</th>
            <th>Nomor Telepon</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        {% for result in results %}
        <tr class="center aligned">
            <th>{{result.id}}</th>
            <th>{{result.nama}}</th>
            <th>{{result.no_id}}</th>
            <th>{{result.email}}</th>
            <th>{{result.alamat}}</th>
            <th>{{result.no_telepon}}</th>
            <th>
                {% if result.admin === '1' %}
                Pustakawan
                {% else %}
                Anggota Biasa
                {% endif %}
            </th>
            <th>
                <div>
                    <a href="ubah-anggota/{{result.id}}" class="ui labeled icon blue button">
                        <i class="edit outline icon"></i>
                        Edit
                    </a>
				</div>
                <button class="confirm ui labeled icon red button" data-id="{{result.id}}" data-nama="{{result.nama}}">
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
        Hapus Anggota
    </div>
    <div class="content">
        <p>Apakah Anda yakin ingin menghapus <span id="confirm-nama"></span> dari keanggotaan perpustakaan?</p>
    </div>
    <div class="actions">
        <div class="ui negative button">
            Tidak
        </div>
        <div style="display: inline-block;">
            <form method="POST" action="{{url("hapus-anggota")}}" class="ui form">
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
    $("table").tablesort();
</script>
{% endblock %}
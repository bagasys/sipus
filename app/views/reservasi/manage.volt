{% extends "layouts\base.volt" %}
{% block content %}

<form method="POST" action="{{ url("daftar-reservasi") }}">
        <label for="searchBy">Cari Berdasarkan: </label>
        <select name="searchBy">
            <option value="nama">Nama Anggota</option>
            <option value="judul">Judul Buku</option>
            <option value="id_buku">Id Buku</option>
            <option value="id_user">Id User</option>
            <option value="id_reservasi">Id Reservasi</option>
           
        </select>
    <div class="ui search item">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Cari Reservasi" name = "searchKey">
            <input class="circular ui brown icon button" type="submit" value="">
            <i class="search icon"></i>
        </div>
        <div class="results"></div>
    </div>
</form>



<table class="ui selectable inverted brown celled table">
    <thead>
        <tr class="center aligned">
            <th>ID Reservasi</th>
            <th>ID User</th>
            <th>Nama User</th>
            <th>ID Buku</th>
            <th>Nama Buku</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        {% for peminjaman in peminjamans %} 
        <tr class="center aligned">
            <th>{{ peminjaman.idp }}</th>
            <th>{{ peminjaman.id_user }}</th>
            <th>{{ peminjaman.nama }}</th>
            <th>{{ peminjaman.id_buku }}</th>
            <th>{{ peminjaman.judul }}</th>
            <th>
                <form method="POST" action="{{url("hapus-reservasi")}}" class="ui form">
                    <input type="hidden" name="id" value="{{reservasi.id}}">
                    <input type="submit" value="Hapus">
                </form> 
            </th>
        </tr>
       
        {% endfor %} 
    </tbody>
</table>
{% endblock %}
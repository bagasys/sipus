{% extends "layouts\base.volt" %}
{% block content %}

<form method="POST" action="{{ url("daftar-reservasi") }}">
        <label for="searchBy">Cari Berdasarkan: </label>
        <select name="searchBy">
            <option value="nama">Nama Anggota</option>
            <option value="judul">Judul Buku</option>
            <option value="id buku">Id Buku</option>
            <option value="id user">Id User</option>
            <option value="id reservasi">Id Reservasi</option>
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
        {% for reservasi in reservasis %} 
        <tr class="center aligned">
            <th>{{ reservasi.id }}</th>
            <th>{{ reservasi.id_user }}</th>
            <th>{{ users[count].nama }}</th>
            <th>{{ reservasi.id_buku }}</th>
            <th>{{ bukus[count].judul }}</th>
            <th>
                <form method="POST" action="{{url("hapus-reservasi")}}" class="ui form">
                    <input type="hidden" name="id" value="{{reservasi.id}}">
                    <input type="submit" value="Hapus">
                </form> 
            </th>
        </tr>
        {% set count = count + 1 %}
       
        {% endfor %} 
    </tbody>
</table>
{% endblock %}
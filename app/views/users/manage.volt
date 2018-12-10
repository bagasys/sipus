{% extends "layouts\base.volt" %}
{% block content %}
<div>
    <a href="tambah-anggota">Daftarkan Anggota Baru</a>    
</div>
<form method="GET" action="daftar-anggota">
    <div class="ui search item">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Search for books...">
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
            <th>Nama Lengkap</th>
            <th>Nomor Kartu Identitas</th>
            <th>Email</th>
            <th>Alamat</th>
            <th>Nomor Telepon</th>
            <th>Status Admin</th>
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
            <th>{{result.admin}}</th>
            <th>
                <div>
                    <a href="ubah-anggota/{{result.id}}">Edit</a>
				</div>
                <form method="POST" action="{{url("hapus-anggota")}}" class="ui form">
                    <input type="hidden" name="id" value="{{result.id}}">
                    <input type="submit" value="Hapus">
                </form> 
            </th>
        </tr>
        {% endfor %}
    </tbody>
</table>
{% endblock %}
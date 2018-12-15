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
    <div class="ui search item">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Cari nama anggota..." name = "title">
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
                    <a href="ubah-anggota/{{result.id}}" class="ui labeled icon button">
                        <i class="edit icon"></i>
                        Edit
                    </a>
				</div>
                <form method="POST" action="{{url("hapus-anggota")}}" class="ui form">
                    <input type="hidden" name="id" value="{{result.id}}">
                    <button type="submit" class="ui labeled icon button">
                        <i class="trash alternate icon"></i>
                        Hapus
                    </button>
                </form> 
            </th>
        </tr>
        {% endfor %}
    </tbody>
</table>
{% endblock %}
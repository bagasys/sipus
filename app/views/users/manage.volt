{% extends "layouts\base.volt" %}
{% block content %}
<table class="ui selectable inverted brown celled table">

    <thead>
        <tr class="center aligned">
            <th>ID</th>
            <th>Nama Lengkap</th>
            <th>Email</th>
            <th>Alamat</th>
            <th>Nomor Telepon</th>
            <th>Nomor Kartu Identitas</th>
            <th>Status Admin</th>
            <th>Aksi<th>
        </tr>
    </thead>
    <tbody>
        {% for result in results %}
        <tr class="center aligned">
            <th>{{result.id}}</th>
            <th>{{result.nama}}</th>
            <th>{{result.email}}</th>
            <th>{{result.alamat}}</th>
            <th>{{result.no_telepon}}</th>
            <th>{{result.no_id}}</th>
            <th>{{result.admin}}</th>
            <th> <a href="ubah-anggota/{{result.id}}">Edit</a> <br>
				<form method="POST" action="{{url("hapus-anggota")}}" class="ui form">
                    <input type="hidden" name="id" value="{{result.id}}">
                    <input type="submit" value="Hapus">
                </form> 
            <th>
        </tr>
        {% endfor %}
    </tbody>
</table>
{% endblock %}
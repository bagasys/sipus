{% extends "layouts\base.volt" %}
{% block content %}
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
            <th><img src="{{ url("img/sipus_logo.png") }}"></th>
            <th>{{result.jumlah}}</th>
            <th>{{result.jumlah_tersedia}}</th>
            <th>{{result.status}}</th>
        </tr>
        {% endfor  %}
    </tbody>
</table>
{% endblock %}
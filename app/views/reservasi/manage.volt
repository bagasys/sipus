{% extends "layouts\base.volt" %}
{% block content %}

<form method="POST" action="{{ url("daftar-reservasi") }}">
    <div class="ui search item">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Cari peminjaman by ISBN-ISSN..." name = "id_buku">
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
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        {% for reservasi in reserve %}
        <?php $user = $reservasi->id_user ?> 
        <tr class="center aligned">
            <th>{{ reservasi.id }}</th>
            <th>{{ reservasi.id_user }}</th>
            <th>{{ reservasi.id_user.nama }}</th>
            <th>{{ reservasi.id_buku }}</th>
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
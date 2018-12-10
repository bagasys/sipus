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
        <tr class="center aligned">
            <th>14045</th>
            <th>000-000-000-000</th>
            <th>Introduction to Algorithms</th>
            <th>J. K. Rowling</th>
            <th>Mizan</th>
            <th>Mystery, Romance</th>
            <th>Buku ini berisi tentang blablabla</th>
            <th>500 halaman, hardcover</th>
            <th>500 WOW rk.1</th>
            <th><img src="{{ url("img/sipus_logo.png") }}"></th>
            <th>10</th>
            <th>5</th>
            <th>blablabla</th>
        </tr>
    </tbody>
</table>
{% endblock %}
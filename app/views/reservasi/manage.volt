{% extends "layouts\base.volt" %}
{% block content %}
<table class="ui selectable inverted brown celled table">
    <thead>
        <tr class="center aligned">
            <th>ID Peminjaman</th>
            <th>ID User</th>
            <th>ID Buku</th>
            <th>Tanggal Pinjam</th>
            <th>Tanggal Harus Kembali</th>
            <th>Tanggal Kembali</th>
            <th>Denda</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
{#        {% for result in results %} #}
        <tr class="center aligned">
            <th>14045</th>
            <th>32</th>
            <th>500600</th>
            <th>26 April 2019</th>
            <th>8 Mei 2019</th>
            <th>-</th>
            <th>Rp. 0,-</th>
            <th>Sedang dipinjam</th>
        </tr>
{#        {% endfor %} #}
    </tbody>
</table>
{% endblock %}
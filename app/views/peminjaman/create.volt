{% extends "layouts\base.volt" %}
{% block content %}
<div class="ui two column centered grid">
    <form method="POST" action="{{ url("pinjam") }}" class="ui form">
        <div class="field">
            <label for="id_user">Nomor Kartu Identitas Anggota</label>
            <input type="text" name="id_user" placeholder="">
        </div>
        <div class="field">
            <label for="id_buku">ISBN / ISSN Buku</label>
            <input type="text" name="id_buku" placeholder="">
        </div>
        <input type="submit" value="Pinjamkan Buku" class="ui inverted brown button">
    </form>
</div>

{% endblock %}
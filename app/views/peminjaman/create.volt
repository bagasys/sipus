{% extends "layouts\base.volt" %}

{% block title %}
Pinjam Buku
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Pinjamkan Buku
        </div>
    </div>
</div>
<div class="ui two column centered grid">
    <form method="POST" action="{{ url("pinjam") }}" class="ui form">
        <div class="field">
            <label for="id_buku">ISBN / ISSN Buku</label>
            <input type="text" name="ISBN_ISSN" placeholder="">
        </div>
        <div class="field">
            <label for="id_user">Nomor ID Anggota</label>
            <input type="text" name="no_id" placeholder="">
        </div>
        <div class="field">
            <label for="email">Email</label>
            <input type="email" name="email" placeholder="">
        </div>
        <div class="field">
            <label for="password">Password</label>
            <input type="password" name="password" placeholder="">
        </div>
        
        <input type="submit" value="Pinjamkan Buku" class="ui black button">
    </form>
</div>

{% endblock %}
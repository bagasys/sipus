{% extends "layouts\base.volt" %}

{% block title %}
Ubah Buku
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Ubah Data Anggota
        </div>
    </div>
</div>
<div class="ui two column centered grid">
    <form method="POST" action="{{ url("ubah-anggota") }}" class="ui form">
    	<input type="hidden" name="id" value="{{results.id}}">
        <div class="field">
            <label for="nama">Nama Lengkap</label>
            <input type="text" name="nama" placeholder="Ex: Joko Widodo" value="{{results.nama}}">
        </div>
        <div class="field">
            <label for="no_id">Nomor Kartu Identitas</label>
            <input type="text" name="no_id" placeholder="Ex: 05111740000112" value="{{results.no_id}}">
        </div>
        <div class="field">
            <label for="alamat">Alamat</label>
            <input type="text" name="alamat" placeholder="Ex: Semolowaru Elok L-39" value="{{results.alamat}}">
        </div>
        <div class="field">
            <label for="telp">Nomor Telepon</label>
            <input type="text" name="telp" placeholder="Ex: 08123456789" value="{{results.no_telepon}}">
        </div>
        <div class="field">
            <label for="email">E-mail</label>
            <input type="text" name="email" placeholder="Ex: example@mail.com" value="{{results.email}}">
        </div>
        <div class="two fields">
            <div class="field">
                <label for="password">Password</label>
                <input type="password" name="password" placeholder="">
            </div>
            <div class="field">
                <label for="cpassword">Confirm Password</label>
                <input type="password" name="cpassword" placeholder="">
            </div>
        </div>
        <input type="hidden" name="admin" value="{{results.admin}}">
        <input type="submit" value="Ubah Data Anggota" class="ui inverted brown button">
    </form>
</div>

{% endblock %}
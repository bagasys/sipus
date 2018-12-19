{% extends "layouts\base.volt" %}

{% block title %}
Pengembalikan Buku
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Kembalikan Buku
        </div>
    </div>
</div>
<div class="ui two column centered grid">

{% for peminjaman in peminjamans %}
<form method="POST" action="{{url("kembalikan")}}" class="ui form">
    <div class="field"></div>
    <div class="field">
        <div class="ui labeled input">
            <div class="ui brown label">
                ID Peminjaman
            </div>
            <div class="ui disabled input">
                <input type="text" value="{{ peminjaman.idp }}" name = "id">
            </div>
        </div>
    </div>
    <div class="field">
        <div class="ui labeled input">
            <div class="ui brown label">
                ID Peminjam
            </div>
            <div class="ui disabled input">
                <input type="text" value="{{ peminjaman.no_id }}">
            </div>
        </div>
    </div>
    <div class="field">
        <div class="ui labeled input">
            <div class="ui brown label">
                Nama Peminjam
            </div>
            <div class="ui disabled input">
                <input type="text" value="{{ peminjaman.nama }}">
            </div>
        </div>
    </div>
    <div class="field">
        <div class="ui labeled input">
            <div class="ui brown label">
                ID Buku
            </div>
            <div class="ui disabled input">
                <input type="text" value="{{ peminjaman.ISBN_ISSN }}" name = "id_buku">
            </div>
        </div>
    </div>
    <div class="field">
        <div class="ui labeled input">
            <div class="ui brown label">
                Judul Buku
            </div>
            <div class="ui disabled input">
                <input type="text" value="{{ peminjaman.judul }}">
            </div>
        </div>
    </div>
    <div class="field">
        <div class="ui labeled input">
            <div class="ui brown label">
                Tanggal Pinjam
            </div>
            <div class="ui disabled input">
                <input type="text" value="{{ peminjaman.tgl_pinjam }}">
            </div>
        </div>
    </div>
    <div class="field">
        <div class="ui labeled input">
            <div class="ui brown label">
                Tanggal harus Kembali
            </div>
            <div class="ui disabled input">
                <input type="text" value="{{ peminjaman.tgl_hrs_kembali }}">
            </div>
        </div>
    </div>
    <div class="field">
        <div class="ui labeled input">
            <div class="ui brown label">
                Tanggal Kembali
            </div>
            <div class="ui disabled input">
                <input type="text" value="{{ peminjaman.tgl_kembali }}">
            </div>
        </div>
    </div>
    <div class="field">
        <div class="ui labeled input">
            <div class="ui red label">
                Denda
            </div>
            <div class="ui disabled input">
                <input type="text" value="Rp. {{ peminjaman.denda }},-">
            </div>
        </div>
    </div>
    <div class="field">
        <div class="ui labeled input">
            <div class="ui brown label">
                Status
            </div>
            <div class="ui disabled input">
                <input type="text" value="{{ peminjaman.status }}">
            </div>
        </div>
    </div>
    <input type="submit" value="Kembalikan" class="ui secondary button">
</form>
{% endfor %} 
</div>
<style>
    .ui.label {
        min-width: 200px;
    }
</style>
{% endblock %}
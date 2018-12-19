{% extends "layouts\base.volt" %}

{% block title %}
Data Peminjaman
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="ui huge header">
            Peminjaman oleh {{ session.get('auth')['nama'] }}
        </div>
    </div>
</div>
<div class="ui four column grid">
{% for result in results %}
    <div class="column">
        <a class="ui centered brown card" href="#">
            <div>
                <img src="{{config.url.baseUrl}}{{result.gambar_buku}}" alt="{{result.ISBN_ISSN}}.jpg" class="ui centered small image">
            </div>
            <div class="content">
                <div class="header">{{result.judul}}</div>
                <div class="meta">
                    <span class="category">{{result.pengarang}}</span>
                </div>
                <div class="description">
                    Tanggal pinjam: {{result.tgl_pinjam}} <br>
                    Tanggal harus kembali: {{result.tgl_hrs_kembali}}
                </div>
            </div>
            <div class="extra content">
                Status: {{result.status}}
            </div>
        </a>
    </div>

{% endfor %}   
</div>
{% endblock %}
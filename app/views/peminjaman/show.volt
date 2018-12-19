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
        <center>
            <img src="{{config.url.baseUrl}}{{result.gambar_buku}}" alt="{{result.ISBN_ISSN}}.jpg">
            <div class="ui header">
                <div class="content">
                    <div class="book-title">
                        {{result.judul}}
                    </div>
                </div>
                <div class="sub header">
                    <div class="book-author">
                        {{result.pengarang}}
                    </div>
                </div>
            </div>
            <div>
                {{result.tgl_pinjam}} - {{result.tgl_hrs_kembali}}
            </div>
            <div>
                {{result.status}}
            </div>
        </center>
    </div>
{% endfor %}   
</div>
{% endblock %}
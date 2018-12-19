{% extends "layouts\base.volt" %}

{% block title %}
Data Reservasi
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="ui huge header">
            Reservasi oleh {{ session.get('auth')['nama'] }}
        </div>
    </div>
</div>
<div class="ui four column grid">
{% for result in results %}
    <div class="column">
        <center>
            {{ image("img/sipus_logo.png") }}
{#            <img src="{{config.url.baseUrl}}{{result.gambar_buku}}" alt="{{result.ISBN_ISSN}}.jpg"> #}
            <div class="ui header">
                <div class="content">
                    <div class="book-title">
                        Judul Buku : {{result.judul}}
                    </div>
                </div>
                <div class="sub header">
                    <div class="book-author">
                        Pengarang : {{result.pengarang}}
                    </div>
                </div>
            </div>
            <div>
                {{result.tgl_reservasi}}
            </div>
            <div>
                <form method="POST" action="{{url("hapus-reservasi")}}" class="ui form">
                    <input type="hidden" name="id" value="{{result.idr}}">
                    <input type="submit" value="Batalkan">
                </form>               
            </div>
        </center>
    </div>
{% endfor %}   
</div>
{% endblock %}
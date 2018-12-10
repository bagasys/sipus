{% extends "layouts\base.volt" %}
{% block content %}
<div class="ui huge header">
    Peminjaman oleh {{ session.get('auth')['nama'] }}
</div>
<div class="ui four column grid">
{# loop mulai #}
    <div class="column">
        <center>
            <img src="{{ url("img/sipus_logo.png") }}">
            <div class="ui header">
                <div class="content">
                    <div class="book-title">
                        Judul Buku
                    </div>
                </div>
                <div class="sub header">
                    <div class="book-author">
                        Pengarang
                    </div>
                </div>
            </div>
            <div>
                26 April 2019 - 8 Mei 2019
            </div>
        </center>
    </div>
{# loop mulai #}   
</div>
{% endblock %}
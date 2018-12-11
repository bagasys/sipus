{% extends "layouts\base.volt" %}
{% block content %}
<div class="ui huge header">
    Reservasi oleh {{ session.get('auth')['nama'] }}
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
                26 April 2019
            </div>
            <div>
                <form method="POST" action="{{ url("hapus-reservasi") }}">
                    <input type="hidden" value="{{id_buku}}">
                    <input type="submit" value="Batalkan">
                </form>                
            </div>
        </center>
    </div>
{# loop mulai #}   
</div>
{% endblock %}
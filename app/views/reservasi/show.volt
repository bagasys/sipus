{% extends "layouts\base.volt" %}
{% block title %}
Data Reservasi
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Reservasi oleh {{ session.get('auth')['nama'] }}
        </div>
    </div>
</div>
<div class="ui four column grid">
{% for result in results %}
    <div class="column">
        <center>
            {{ image("img/sipus_logo.png") }}
            <div class="ui header">
                <div class="content">
                    <div class="book-title">
                        Judul Buku {{result.id}}
                    </div>
                </div>
                <div class="sub header">
                    <div class="book-author">
                        Pengarang {{result.id}}
                    </div>
                </div>
            </div>
            <div>
                26 April 2019
            </div>
            <div>
                <form method="POST" action="{{url("hapus-reservasi")}}" class="ui form">
                    <input type="hidden" name="id" value="{{result.id}}">
                    <input type="submit" value="Batalkan">
                </form>               
            </div>
        </center>
    </div>
{% endfor %}   
</div>
{% endblock %}
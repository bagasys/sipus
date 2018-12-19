{% extends "layouts\base.volt" %}

{% block title %}
Detail
{% endblock %}

{% block content %}
<div class="ui equal width grid">
    <div class="row">
        <div class="center aligned column">
            <img src="{{config.url.baseUrl}}{{results.gambar_buku}}" alt="{{results.ISBN_ISSN}}.jpg" height="50%">
            {% if session.has('auth') %}
            <p>
                {{results.kategori}}
            </p>
            <form method="POST" action="{{ url("reservasi") }}">
                <input type="hidden" value="{{results.id}}" name = "id_buku">
                <button type="submit" class="ui labeled icon green button">
                    <i class="bookmark outline icon"></i>
                    Reservasi
                </button>
            </form>
            {% endif %}
        </div>
        <div class="column">
            <div class="title">
                {{results.judul}}
            </div>
            <br><br>
            <div class="subtitle">
                {{results.pengarang}}
            </div>
            <br>
            <div class="tagline">
                {{results.penerbit}}
            </div>
            <div class="ui piled segment" style="max-width: 75%;">
            <p>
                {{results.deskripsi}}
                Te eum doming eirmod, nominati pertinacia argumentum ad his. Ex eam alia facete scriptorem, est autem aliquip detraxit at. Usu ocurreret referrentur at, cu epicurei appellantur vix. Cum ea laoreet recteque electram, eos choro alterum definiebas in. Vim dolorum definiebas an. Mei ex natum rebum iisque.
            </p>
            </div>
        </div>
    </div>
</div>

{% endblock %}
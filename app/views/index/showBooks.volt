{% extends "layouts\base.volt" %}

{% block title %}
Catalogue
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Katalog Koleksi Perpustakaan
        </div>
    </div>
</div>
<div class="ui four column grid">
{% for result in results %}
    <div class="column">
        <a class="ui centered brown card" href="details/{{result.id}}">
            <div>
                <img src="{{config.url.baseUrl}}{{result.gambar_buku}}" alt="{{result.ISBN_ISSN}}.jpg" class="ui centered small image">
            </div>
            <div class="content">
                <div class="header">{{result.judul}}</div>
                <div class="meta">
                    <span class="category">{{result.pengarang}}</span>
                </div>
                <div class="description">
                    {{result.deskripsi}}
                </div>
            </div>
            <div class="extra content">
                {{result.kategori}}
            </div>
        </a>
    </div>
{% endfor %}   
</div>
{% endblock %}
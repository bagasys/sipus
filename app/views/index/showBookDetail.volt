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
            <?php if($!flag == 1){ ?>
            <form method="POST" action="{{ url("reservasi") }}">
                <input type="hidden" value="{{results.id}}" name = "id_buku">
                <button type="submit" class="ui labeled icon green button">
                    <i class="bookmark outline icon"></i>
                    Reservasi
                </button>
            </form>
            <?php } ?>
            {% endif %}
        </div>
        <div class="column">
            <div class="title">
                {{results.judul}}
            </div>
            <div class="subtitle">
                {{results.pengarang}}
            </div>
            <div class="tagline">
                {{results.penerbit}}
            </div>
            <div class="ui piled segment" style="max-width: 75%;">
                <p>
                    {{results.deskripsi}}
                </p>
            </div>
        </div>
    </div>
</div>

{% endblock %}
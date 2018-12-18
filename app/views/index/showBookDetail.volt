{% extends "layouts\base.volt" %}
{% block title %}
Detail
{% endblock %}

{% block content %}
<div class="ui equal width grid">
    <div class="row">
        <div class="center aligned column">
            {{ image("img/sipus_logo.png") }}
            {% if session.has('auth') %}
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
            <h1>
                {{results.judul}}
            </h1>
            <h1>
                {{results.pengarang}}
            </h1>
            <h1>
                {{results.penerbit}}
            </h1>
            <h1>
                {{results.kategori}}
            </h1>
            <h1>
                {{results.deskripsi}}
            </h1>
        </div>
    </div>
</div>

{% endblock %}
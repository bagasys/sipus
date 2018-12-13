{% extends "layouts\base.volt" %}
{% block title %}
Detail
{% endblock %}

{% block content %}
<div class="ui equal width grid">
    <div class="row">
        <div class="column">
            {{ image("img/sipus_logo.png") }}
            {% if session.has('auth') %}
            <form method="POST" action="{{ url("reservasi") }}">
                <input type="hidden" value="{{results.id}}" name = "id_buku">
                <input type="submit" value="Reservasi">
            </form>
            {% endif %}
        </div>
        <div class="column">
            <div class="row">
                {{results.judul}} <br>
                {{results.pengarang}} <br>
                {{results.penerbit}} <br>
                {{results.id}} <br>
            </div>
            <div class="row">
                Pengarang
            </div>
        </div>
    </div>
</div>

{% endblock %}
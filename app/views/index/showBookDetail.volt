{% extends "layouts\base.volt" %}
{% block content %}
<img src="img/sipus_logo.png">
{% if session.has('auth') %}
<form method="POST" action="{{ url("reservasi") }}">
    <input type="hidden" value="{{id_buku}}">
    <input type="submit" value="Reservasi">
</form>
{% endif %}

{% endblock %}
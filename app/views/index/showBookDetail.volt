{% extends "layouts\base.volt" %}
{% block content %}
<img src="../img/sipus_logo.png">

{{results.judul}} <br>
{{results.pengarang}}<br>
{{results.penerbit}}
{{results.id}}
{% if session.has('auth') %}

<form method="POST" action="{{ url("reservasi") }}">
    <input type="hidden" value="{{results.id}}" name = "id_buku">
    <input type="submit" value="Reservasi">
</form>
{% endif %}

{% endblock %}
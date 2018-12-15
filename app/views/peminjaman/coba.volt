{% extends "layouts\base.volt" %}
{% block content %}

<form method="POST" action="{{ url("coba") }}">
    <div class="ui search item">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Cari peminjaman by nama..." name = "nama">
            <input class="circular ui brown icon button" type="submit" value="">
            <i class="search icon"></i>
        </div>
        <div class="results"></div>
    </div>
</form>



{% for user in users %}
    {{user.nama}}
    {{user.id_buku}}
{% endfor %}

{% endblock %}
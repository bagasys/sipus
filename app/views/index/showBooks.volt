{% extends "layouts\base.volt" %}
{% block content %}
<div class="ui four column grid">
    {#loop mulai#}
    <div class="column">
        <center>
            <img src="{{ url("img/sipus_logo.png") }}">
            <div class="ui header">
                <div class="content">Judul Buku</div>
                <div class="sub header">Pengarang</div>
            </div>
        </center>
    </div>
    {#loop berakhir#}
</div>
{% endblock %}
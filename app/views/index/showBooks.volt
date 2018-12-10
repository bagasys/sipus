{% extends "layouts\base.volt" %}
{% block content %}
<div class="ui four column grid">

<form method="GET" action="catalogue">
            <div class="ui search item">
                <div class="ui icon input">
                    <input class="prompt" type="text" placeholder="Search for books...">
                    <input class="circular ui brown icon button" type="submit" value="">
                    <i class="search icon"></i>
                </div>
                <div class="results"></div>
            </div>
        </form>
</form>

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
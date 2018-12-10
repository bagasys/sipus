{% extends "layouts\base.volt" %}

{% block title %}Welcome{% endblock %}


{% block content %}



<div class="ui vertical masthead center aligned segment">
    <div class="ui middle aligned medium image">
        <img src="{{ url("img/sipus_logo.png") }}">
    </div>
    <div class="ui text container">
        <div class="title">
            SiPus
        </div>
        <div class="subtitle">
            Sistem Informasi Perpustakaan    
        </div>
        <div class="tagline">
            jelajahi katalog koleksi perpustakaan kami.
        </div>
    </div>
    <div class="ui search">
        <div class="ui icon input">
            <input class="prompt" type="text" placeholder="Search for books...">
            <input class="circular ui brown icon button" type="submit" value="Search">
            <i class="search icon"></i>
        </div>
        <div class="results"></div>
    </div>
</div>
{% endblock %}
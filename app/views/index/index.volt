{% extends "layouts\base.volt" %}

{% block title %}
Welcome
{% endblock %}

{% block content %}
<div class="ui vertical masthead center aligned segment">
    <div class="animate ui middle aligned medium image" style="display: none;">
        {{ image("img/sipus_logo.png") }}
    </div>
    <div class="ui text container">
        <div class="text-animate title" style="display: none;">
            SiPus
        </div>
        <div class="text-animate subtitle" style="display: none;">
            Sistem Informasi Perpustakaan    
        </div>
        <div class="text-animate tagline" style="display: none;">
            jelajahi katalog koleksi perpustakaan kami.
        </div>
    </div>
    <div class="search-animate" style="display: none;">
        <form method="POST" action="{{ url("catalogue") }}">
            <div class="ui search">
                <div class="ui icon input">
                    <input class="prompt" type="text" placeholder="Search for books..." name="title">
                    <input class="circular ui brown icon button" type="submit" value="Search">
                    <i class="search icon"></i>
                </div>
                <div class="results"></div>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('.animate').transition({
            animation   : 'horizontal flip'
        });
        $('.text-animate').transition({
            animation   : 'fade up',
            duration    : 1000,
            interval    : 750
        });
        $('.search-animate').transition({
            animation   : 'fly down',
            duration    : 2750
        });
    });
</script>
{% endblock %}
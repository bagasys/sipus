<!DOCTYPE html>
<html>
<head>
    {% include 'layouts\header.volt' %}
    <title>Sipus - {% block title %}{% endblock %}</title>
</head>
<body style="background-image: url('img/background2.jpg'); background-repeat: no-repeat; background-size: 100% 100%">
    <div class="ui brown inverted menu">
        <a class="item">
            <img class="ui mini image" src="{{ url("img/sipus_logo.png") }}">
        </a>
        <a class="item">Browse Catalogue</a>
        <div class="ui search item">
            <div class="ui icon input">
                <input class="prompt" type="text" placeholder="Search for books...">
                <input class="circular ui brown icon button" type="hidden" value="">
                <i class="search icon"></i>
            </div>
            <div class="results"></div>
        </div>        
        <div class="right menu">
            <a class="item">Login</a>
            <a class="item">Sign Up</a>
        </div>
    </div>
{#
    {% if session.has('auth') %}
        <p style="color:white">Halo, {{ session.get('auth')['username'] }} </p>
        <a href="{{ url("logout") }}">Log out</a>
    {% else %}
        <a href="{{ url("login") }}">Log in</a>
    {% endif %}
#}
    {% block content %} {% endblock %}

{# ini footer #}

</body>
</html>
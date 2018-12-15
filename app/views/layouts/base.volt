<!DOCTYPE html>
<html>
<head>
    {% include 'layouts\header.volt' %}
    <title>Sipus - {% block title %}{% endblock %}</title>
</head>
<body style="background-image: url('img/background2.jpg'); background-repeat: no-repeat; background-size: 100% 100%">
    <div class="ui brown inverted menu">
        <a href="{{ url("") }}" class="item">
            <img class="ui mini image" src="{{ url("img/sipus_logo.png") }}">
        </a>
        <a href="{{ url("catalogue") }}" class="item">Browse Catalogue</a>
        <form method="POST" action="catalogue">
            <div class="ui search item">
                <div class="ui icon input">
                    <input class="prompt" type="text" placeholder="Search for books..." name = "title">
                    <input class="circular ui brown icon button" type="submit" style="display: none;">
                    <i class="brown search icon"></i>
                </div>
                <div class="results"></div>
            </div>
        </form>
        <div class="right menu">
            {% if session.has('auth') %}
            <div class="ui simple dropdown item">
                {{ session.get('auth')['nama'] }}
                <i class="dropdown icon"></i>
                <div class="menu">
                    {% if session.get('auth')['status'] === '0' %}
                    <div class="item"><a href="{{ url("peminjaman") }}" style="color: black;">Data Peminjaman</a></div>
                    <div class="item"><a href="{{ url("reservasi") }}" style="color: black;">Data Reservasi</a></div>
                    {% elseif session.get('auth')['status'] === '1' %}
                    <div class="item"><a href="{{ url("daftar-buku") }}" style="color: black;">Daftar Buku</a></div>
                    <div class="item"><a href="{{ url("daftar-anggota") }}" style="color: black;">Daftar Anggota</a></div>
                    <div class="item"><a href="{{ url("daftar-peminjaman") }}" style="color: black;">Daftar Peminjaman</a></div>
                    {% endif %}
                    <div class="item"><a href="{{ url("logout") }}" style="color: black;">Logout</a></div>
                </div>
            </div>
            {% else %}
                <a href="{{ url("login") }}" class="item">Log in</a>
            {% endif %}
        </div>
    </div>

    

    {% block content %} {% endblock %}

{# ini footer #}

</body>
</html>
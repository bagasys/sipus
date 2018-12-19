<!DOCTYPE html>
<html>
<head>
    {% include 'layouts\header.volt' %}
    <title>Sipus - {% block title %}{% endblock %}</title>
</head>
<body style="background-image: url('{{config.url.baseUrl}}img/background2.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: 100% 100%;">
    <div class="ui brown inverted fixed menu">
        <a href="{{ url("") }}" class="item">
            <img class="ui mini image" src="{{ url("img/sipus_logo.png") }}">
        </a>
        {% if session.get('auth')['status'] === '1' %}
        <a href="{{ url("dashboard") }}" class="item">Area Pustakawan</a>
        {% endif %}
        <a href="{{ url("catalogue") }}" class="item">Browse Catalogue</a>
        <form method="POST" action="catalogue" class="item">
            <div class="ui search">
                <div class="ui icon input">
                    <input class="prompt" type="text" placeholder="Search for books..." name = "searchKey">
                    <input class="circular ui brown icon button" type="submit" style="display: none;">
                    <i class="brown search icon"></i>
                </div>
                <div class="results"></div>
            </div>
            <select name="searchBy" class="ui dropdown">
                <option value="">Advanced Search</option>
                <option value="ISBN_ISSN">ISBN/ISSN</option>
                <option value="judul">Judul Buku</option>
                <option value="pengarang">Pengarang</option>
                <option value="penerbit">Penerbit</option>      
                <option value="kategori">Kategori</option>
            </select>
        </form>
<!-- <div class="item">
<div class="ui floating dropdown labeled icon button">
  <i class="search icon"></i>
  <span class="text">Search</span>
  <div class="menu">
    <div class="ui icon search input">
      <i class="search icon"></i>
      <input type="text" placeholder="Search tags...">
    </div>
    <div class="divider"></div>
    <div class="header">
      <i class="tags icon"></i>
      Advanced Search
    </div>
    <div class="scrolling menu">
      <div class="item">
        <div class="ui red empty circular label"></div>
        Important
      </div>
      <div class="item">
        <div class="ui blue empty circular label"></div>
        Announcement
      </div>
      <div class="item">
        <div class="ui black empty circular label"></div>
        Cannot Fix
      </div>
      <div class="item">
        <div class="ui purple empty circular label"></div>
        News
      </div>
      <div class="item">
        <div class="ui orange empty circular label"></div>
        Enhancement
      </div>
      <div class="item">
        <div class="ui empty circular label"></div>
        Change Declined
      </div>
      <div class="item">
        <div class="ui yellow empty circular label"></div>
        Off Topic
      </div>
      <div class="item">
        <div class="ui pink empty circular label"></div>
        Interesting
      </div>
      <div class="item">
        <div class="ui green empty circular label"></div>
        Discussion
      </div>
    </div>
  </div>
</div>
</div> -->
        <div class="right menu">
            {% if session.has('auth') %}
            <div class="ui dropdown item">
                <div class="text">
                {{ session.get('auth')['nama'] }}
                </div>
                <i class="dropdown icon"></i>
                <div class="menu">
                    {% if session.get('auth')['status'] === '0' %}
                    <a href="{{ url("peminjaman") }}" class="item">Data Peminjaman</a>
                    <a href="{{ url("reservasi") }}" class="item">Data Reservasi</a>
                    {% elseif session.get('auth')['status'] === '1' %}
                    <a href="{{ url("daftar-buku") }}" class="item">Daftar Buku</a>
                    <a href="{{ url("daftar-anggota") }}" class="item">Daftar Anggota</a>
                    <a href="{{ url("daftar-peminjaman") }}" class="item">Daftar Peminjaman</a>
                    <a href="{{ url("daftar-reservasi") }}" class="item">Daftar Reservasi</a>
                    {% endif %}
                    <a href="{{ url("logout") }}" class="item">Logout</a>
                </div>
            </div>
            {% else %}
                <a href="{{ url("login") }}" class="item">Log in</a>
            {% endif %}
        </div>
    </div>
    <div style="position: relative; top: 100px;">
        {% block content %} {% endblock %}
    </div>
{# ini footer #}

<script>
    $('.ui.dropdown')
        .dropdown();
</script>

</body>
</html>
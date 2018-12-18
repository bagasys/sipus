{% extends "layouts\base.volt" %}

{% block title %}
Daftar Peminjaman
{% endblock %}

{% block content %}


<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Daftar Peminjaman
        </div>
    </div>
</div>
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <a href="pinjam">Pinjam Buku</a>
    </div>
</div>


        {% for peminjaman in peminjamans %}

            {{ peminjaman.idp }}<br>
            {{ peminjaman.id_user}}<br>
            {{ peminjaman.nama }}<br>
            {{ peminjaman.id_buku }}<br>
            {{ peminjaman.judul }}<br>
            {{ peminjaman.tgl_pinjam }}<br>
            {{ peminjaman.tgl_hrs_kembali  }}<br>
            {{ peminjaman.tgl_kembali }}<br>
            Rp. {{ peminjaman.denda }},-<br>
            {{ peminjaman.status }}<br>
            
             
       
        {% endfor %} 

{% endblock %}
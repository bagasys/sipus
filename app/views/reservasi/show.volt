{% extends "layouts\base.volt" %}

{% block title %}
Data Reservasi
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="ui huge header">
            Reservasi oleh {{ session.get('auth')['nama'] }}
        </div>
    </div>
</div>
<div class="ui four column grid">
{% for result in results %}
    <div class="column">
        <a class="ui centered brown card" href="#">
            <div>
                <img src="{{config.url.baseUrl}}{{result.gambar_buku}}" alt="{{result.ISBN_ISSN}}.jpg" class="ui centered small image">
            </div>
            <div class="content">
                <div class="header">{{result.judul}}</div>
                <div class="meta">
                    <span class="category">{{result.pengarang}}</span>
                </div>
                <div class="description">
                    Tanggal reservasi: {{result.tgl_reservasi}}
                </div>
            </div>
            <div class="extra content center aligned">
                <button class="confirm ui labeled icon red button" data-id="{{result.idr}}" data-judul="{{result.judul}}">
                    <i class="times icon"></i>
                    Batalkan
                </button>
            </div>
        </a>
    </div>
{% endfor %}   
</div>
<div class="ui mini test modal">
    <div class="header">
        Batalkan Reservasi
    </div>
    <div class="content">
        <p>Apakah Anda yakin ingin membatalkan reservasi buku <span id="confirm-judul"></span>?</p>
    </div>
    <div class="actions">
        <div class="ui negative button">
            Tidak
        </div>
        <div style="display: inline-block;">
            <form method="POST" action="{{url("hapus-reservasi")}}" class="ui form">
                <input type="hidden" name="id" id="confirm-id">
                <button type="submit" class="ui positive right labeled icon button">
                    Ya
                    <i class="checkmark icon"></i>
                </button>
            </form>
        </div>
    </div>
</div>
<script>
    $(".confirm").click(function(){
        var id = $(this).data("id");
        var nama = $(this).data("nama");
        var judul = $(this).data("judul");
        $("#confirm-id").val(id);
        $("#confirm-judul").html(judul);
        $('.mini.modal').modal('show');
    });
</script>
{% endblock %}
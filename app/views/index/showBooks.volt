{% extends "layouts\base.volt" %}
{% block content %}
<div class="ui huge header">
    Katalog Koleksi Perpustakaan
</div>
<div class="ui four column grid">
{% for result in results %}
    <div class="column">
        <center>
            <img src="{{ url("img/sipus_logo.png") }}">
            <div class="ui header">
                <div class="content">
                    <div class="book-title">
                        {{result.judul}}
                    </div>
                </div>
                <div class="sub header">
                    <div class="book-author">
                        {{result.pengarang}}
                    </div>
                </div>
            </div>
        </center>
    </div>
{% endfor %}   
</div>
{% endblock %}
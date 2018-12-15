{% extends "layouts\base.volt" %}
{% block title %}
Catalogue
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Katalog Koleksi Perpustakaan
        </div>
    </div>
</div>
<div class="ui four column grid">
{% for result in results %}
    <div class="column">
        <center>
            <a href = "details/{{result.id}}">
                {{ image("img/sipus_logo.png") }}
            </a>
            <div class="ui header">
                <div class="content">
                    <div class="book-title">
                        <a href = "details/{{result.id}}" style="color: #a5673f;">
                            {{result.judul}}
                        </a>
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
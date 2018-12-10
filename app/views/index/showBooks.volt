{% extends "layouts\base.volt" %}
{% block content %}
<div class="ui four column grid">

<form method="POST" action="{{ url("catalogue") }}">
            <div class="ui search item">
                <div class="ui icon input">
                    <input class="prompt" type="text" placeholder="Search for books..." name = "title">
                    <input class="circular ui brown icon button" type="submit" value="">
                    <i class="search icon"></i>
                </div>
                <div class="results"></div>
            </div>
        </form>
</form>
     {% for result in results %}

    <div class="column">
        <center>
            <img src="{{ url("img/sipus_logo.png") }}">
            <div class="ui header">
                <div class="content">{{result.judul}}</div>
                <div class="sub header">{{result.pengarang}}</div>
            </div>
        </center>
    </div>
    
    {% endfor %}
   
</div>
{% endblock %}
{% extends "layouts\base.volt" %}
{% block content %}

{% for result in results %}
    id: {{ result.id}}
{% endfor  %}

<div class="ui equal width grid">

    

    <div class="row">
        <div class="four wide column">
            <img class="ui medium image" src="{{ url("img/s20s_logo_white.png") }}">
            <h5>ini judul buku</h5>
        </div>
        <div class="four wide column">
            hoi
        </div>
        <div class="four wide column">
            heo
        </div>
        <div class="four wide column">
            hia
        </div>
    </div>    
</div>
{% endblock %}
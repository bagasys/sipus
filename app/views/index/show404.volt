{% extends "layouts\base.volt" %}

{% block title %}
Not Found
{% endblock %}

{% block content %}
<div class="ui vertical masthead center aligned segment">
    <div class="ui middle aligned medium image">
        {{ image("img/sipus_logo.png") }}
    </div>
    <div class="ui text container">
        <h1>
            Sorry, the page you're looking for is not found.
        </h1>
    </div>
</div>
{% endblock %}
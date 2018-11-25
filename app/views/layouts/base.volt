<!DOCTYPE html>
<html>
<head>
    {% include 'layouts\header.volt' %}
    <title>{% block title %}{% endblock %} - MyWebpage</title>
</head>
<body>
    <h1>My Todo List</h1>

    {% if session.has('auth') %}
        
        <p style="color:white">Halo, {{ session.get('auth')['username'] }} </p>

        <a href="{{url("logout")}}">Log out</a>
    {% else %}
        <a href="{{url("login")}}">Log in</a>
    {% endif %}


    {% block content %} {% endblock %}
</body>
</html>
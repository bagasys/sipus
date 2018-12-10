{% extends "layouts\base.volt" %}

{% block title %}Login{% endblock %}

{% block content %}

<div class="ui two column centered grid">
    <div class="ui brown inverted segment">
        <form method="POST" action="{{ url("login") }}" class="ui form">
            <div class="field">
                <label>Email</label>
                <input type="text" name="email" placeholder="example@mail.com">
            </div>
            <div class="field">
                <label>Password</label>
                <input type="password" name="password" placeholder="">
            </div>
            <input type="submit" value="Masuk" class="ui brown button">
        </form>
    </div>
</div>


{% endblock %}
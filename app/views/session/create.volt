{% extends "layouts\base.volt" %}

{% block title %}
Login
{% endblock %}

{% block content %}
{#
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Login
        </div>
    </div>
</div>
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
#}

<div class="ui middle aligned center aligned grid">
    <div class="column" style="max-width: 450px;">
        <h2 class="ui brown icon header">
            {{ image("img/sipus_logo.png") }}
            <div class="sub header">
                Please log in to access more features.
            </div>
        </h2>
        <form method="POST" action="{{ url("login") }}" class="ui large form">
            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="envelope icon"></i>
                        <input type="email" name="email" placeholder="example@mail.com">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="password" placeholder="password">
                    </div>
                </div>
                <input type="submit" value="Log in" class="ui fluid large brown submit button">
            </div>
            <div class="ui error message"></div>
        </form>

        <div class="ui message">
            Not a member? Come to our library to register yourself.
        </div>
    </div>
</div>

{% endblock %}
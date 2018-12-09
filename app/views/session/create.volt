{% extends "layouts\base.volt" %}

{% block title %}Login{% endblock %}

{% block content %}
<div class="ui brown inverted segment">
    <div class="ui inverted form">
        <div class="two fields">
        <div class="field">
            <label>First Name</label>
            <input placeholder="First Name" type="text">
        </div>
        <div class="field">
            <label>Last Name</label>
            <input placeholder="Last Name" type="text">
        </div>
        </div>
        <div class="inline field">
        <div class="ui checkbox">
            <input type="checkbox" tabindex="0" class="hidden">
            <label>I agree to the terms and conditions</label>
        </div>
        </div>
        <div class="ui submit button">Submit</div>
    </div>
</div>
<form class="ui form">
    <div class="field">
        <label>First Name</label>
        <input type="text" name="first-name" placeholder="First Name">
    </div>
    <div class="field">
        <label>Last Name</label>
        <input type="text" name="last-name" placeholder="Last Name">
    </div>
    <div class="field">
        <div class="ui checkbox">
        <input type="checkbox" tabindex="0" class="hidden">
        <label>I agree to the Terms and Conditions</label>
        </div>
    </div>
    <button class="ui button" type="submit">Submit</button>
</form>
{% endblock %}
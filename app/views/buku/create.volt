{% extends "layouts\base.volt" %}
{% block content %}
<form method="POST" action="{{ url("tambah-buku") }}">
    <input type="text" name="ISBN_ISSN" placeholder="ISBN">
    <input type="text" name="judul" placeholder="judul">
    <input type="text" name="pengarang" placeholder="pengarang">
    <input type="text" name="kategori" placeholder="kategori">
    <input type="text" name="penerbit" placeholder="penerbit">
    <input type="text" name="deskripsi" placeholder="deskripsi">
    <input type="text" name="deskripsi_fisik" placeholder="deskripsi fisik">
    <input type="text" name="nomor_panggil" placeholder="nomor panggil">
{#    <input type="file" name="gambar_buku" placeholder="gambar buku"> #}
    <input type="submit">
</form>
{% endblock %}
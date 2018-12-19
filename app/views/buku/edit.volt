{% extends "layouts\base.volt" %}

{% block title %}
Ubah Buku
{% endblock %}

{% block content %}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Ubah Data Buku
        </div>
    </div>
</div>
<div class="ui two column centered grid">
    <form method="POST" action="{{ url("ubah-buku") }}" enctype="multipart/form-data" class="ui form">
        <input type="hidden" name="id" value="{{results.id}}">
        <div class="field">
            <label for="ISBN_ISSN">ISBN / ISSN </label>
            <input type="text" name="ISBN_ISSN" placeholder="Ex: 978-0-262-03384-8" value="{{results.ISBN_ISSN}}">
        </div>
        <div class="three fields">
            <div class="field">
                <label for="judul">Judul</label>
                <input type="text" name="judul" placeholder="Ex: Sophie's World" value="{{results.judul}}">        
            </div>
            <div class="field">
                <label for="pengarang">Pengarang</label>
                <input type="text" name="pengarang" placeholder="Ex: J. K. Rowling" value="{{results.pengarang}}">
            </div>
            <div class="field">
                <label for="penerbit">Penerbit</label>
                <input type="text" name="penerbit" placeholder="Ex: Mizan" value="{{results.penerbit}}">
            </div>
        </div>
        <div class="field">
{#
            <label for="kategori">Kategori</label>
            <select name="kategori">
                <option value="satu">coba1</option>
                <option value="dua">coba2</option>
                <option value="tiga">coba3</option>
                <option value="empat">coba4</option>
            </select>
#}
            <select name="kategori" class="ui dropdown">
                <option value="{{results.kategori}}">Pilih kategori buku...</option>
                <option value="Computer science, information and general works">Computer science, information and general works</option>
                <option value="Philosophy and psychology">Philosophy and psychology</option>
                <option value="Religion">Religion</option>
                <option value="Social Sciences">Social Sciences</option>
                <option value="Language">Language</option>
                <option value="Science">Science</option>
                <option value="Technology and applied science">Technology and applied science</option>
                <option value="Arts and recreation">Arts and recreation</option>
                <option value="Literature">Literature</option>
                <option value="History and geography">History and geography</option>
            </select>

        </div>
        <div class="two fields">
            <div class="field">
                <label for="deskripsi">Deskripsi</label>
                <textarea rows="2" name="deskripsi" placeholder="Ex: Novel ini bercerita tentang kehidupan 10 anak..."  value="{{results.deskripsi}}"></textarea>
            </div>
            <div class="field">
                <label for="deskripsi_fisik">Deskripsi Fisik</label>
                <textarea rows="2" name="deskripsi_fisik" placeholder="Ex: Hardcover, First Edition, 461 pages" value="{{results.deskripsi_fisik}}"></textarea>
            </div>
        </div>
        <div class="field">
            <label for="nomor_panggil">Nomor Panggil</label>
            <input type="text" name="nomor_panggil" placeholder="Ex: 423.1 PUR k.3" value="{{results.nomor_panggil}}">
        </div>
        <div class="field">
            <label for="jumlah">Jumlah Buku</label>
            <input type="text" name="jumlah" placeholder="Ex: 100" value="{{results.jumlah}}">
        </div>
        <div class="field">
            <label for="jumlah_tersedia">Jumlah Buku</label>
            <input type="text" name="jumlah_tersedia" placeholder="Ex: 100" value="{{results.jumlah_tersedia}}">
        </div>
        <div class="field">
            <label for="gambar_buku">Cover</label>
            <input type="file" name="gambar_buku">
        </div>
        <input type="submit" value="Ubah Data Buku" class="ui inverted brown button">
    </form>
</div>
<script>
    $('.ui.dropdown')
        .dropdown();
</script>
{% endblock %}
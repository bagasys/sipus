{% extends "layouts\base.volt" %}

{% block title %}
Tambah Buku
{% endblock %}

{% block content %}
{{status}}
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Buku Baru
        </div>
    </div>
</div>
<div class="ui two column centered grid">
    <form method="POST" action="{{ url("tambah-buku") }}" enctype="multipart/form-data" class="ui form">
        <div class="field">
            <label for="ISBN_ISSN">ISBN / ISSN</label>
            <input type="text" name="ISBN_ISSN" placeholder="Ex: 978-0-262-03384-8">
        </div>
        <div class="three fields">
            <div class="field">
                <label for="judul">Judul</label>
                <input type="text" name="judul" placeholder="Ex: Sophie's World">        
            </div>
            <div class="field">
                <label for="pengarang">Pengarang</label>
                <input type="text" name="pengarang" placeholder="Ex: J. K. Rowling">
            </div>
            <div class="field">
                <label for="penerbit">Penerbit</label>
                <input type="text" name="penerbit" placeholder="Ex: Mizan">
            </div>
        </div>
        <div class="field">
            <select name="kategori" class="ui dropdown">
                <option value="">Pilih kategori buku...</option>
                <option value="Computer science, information and general works">Computer science, information and general works</option>
                <option value="Philosophy and psychology">Philosophy and psychology</option>
                <option value="Religion">Religion</option>
                <option value="Social Sciences">Social Sciences</option>
                <option value="Language">Language</option>
                <option value="Science">Science</option>
                <option value="Fiction">Fiction</option>
                <option value="Technology and applied science">Technology and applied science</option>
                <option value="Arts and recreation">Arts and recreation</option>
                <option value="Literature">Literature</option>
                <option value="History and geography">History and geography</option>
            </select>
        </div>
        <div class="two fields">
            <div class="field">
                <label for="deskripsi">Deskripsi</label>
                <textarea rows="2" name="deskripsi" placeholder="Ex: Novel ini bercerita tentang kehidupan 10 anak..."></textarea>
            </div>
            <div class="field">
                <label for="deskripsi_fisik">Deskripsi Fisik</label>
                <textarea rows="2" name="deskripsi_fisik" placeholder="Ex: Hardcover, First Edition, 461 pages"></textarea>
            </div>
        </div>
        <div class="field">
            <label for="nomor_panggil">Nomor Panggil</label>
            <input type="text" name="nomor_panggil" placeholder="Ex: 423.1 PUR k.3">
        </div>
        <div class="field">
            <label for="jumlah">Jumlah Buku</label>
            <input type="text" name="jumlah" placeholder="Ex: 10">
        </div>
        <div class="field">
            <label for="gambar_buku">Cover</label>
            <input type="file" name="gambar_buku">
        </div>
        <input type="submit" value="Tambahkan Buku ke Koleksi" class="ui black button">
    </form>
</div>
<script>
    $('.ui.dropdown')
        .dropdown();
</script>
{% endblock %}
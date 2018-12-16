{{result.id}} <br>
{{result.id_buku}} <br>
{{result.id_user}} <br>
Denda: Rp. {{result.denda}},- <br>

<div class="ui two column centered grid">
    <form method="POST" action="{{ url("kembalikan") }}" class="ui form">
        <div class="field">
            <label for="id_buku">ISBN / ISSN Buku</label>
            <input type="text" name="ISBN_ISSN" placeholder="" value = "">
        </div>
        <div class="field">
            <label for="id_user">Nomor Anggota</label>
            <input type="text" name="no_id" placeholder="">
        </div>
        <div class="field">
            <label for="email">Email</label>
            <input type="email" name="email" placeholder="">
        </div>
        <div class="field">
            <label for="password">Password</label>
            <input type="password" name="password" placeholder="">
        </div>
        
        <input type="submit" value="Pinjamkan Buku" class="ui inverted brown button">
    </form>
</div>
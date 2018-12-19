{% extends "layouts\base.volt" %}

{% block title %}
Tambah Anggota
{% endblock %}

{% block content %}

<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="title">
            Anggota Baru
        </div>
    </div>
</div>
<div class="ui two column centered grid">
    <form method="POST" action="{{ url("tambah-anggota") }}" class="ui form">
        <div class="ui error message">
            <div>
            {{nameErr}}
            </div>
            <div>
            {{emailErr}}
            </div>
        </div>
        <div class="field">
            <label for="nama">Nama Lengkap</label>
            <input type="text" name="nama" placeholder="Ex: Joko Widodo">
        </div>
        <div class="field">
            <label for="no_id">Nomor Kartu Identitas</label>
            <input type="text" name="no_id" placeholder="Ex: 05111740000112">
        </div>
        <div class="field">
            <label for="alamat">Alamat</label>
            <input type="text" name="alamat" placeholder="Ex: Semolowaru Elok L-39">
        </div>
        <div class="field">
            <label for="telp">Nomor Telepon</label>
            <input type="text" name="telp" placeholder="Ex: 08123456789">
        </div>
        <div class="field">
            <label for="email">E-mail</label>
            <input type="text" name="email" placeholder="Ex: example@mail.com">
        </div>
        <div class="two fields">
            <div class="field">
                <label for="password">Password</label>
                <input type="password" name="password" placeholder="">
            </div>
            <div class="field">
                <label for="cpassword">Confirm Password</label>
                <input type="password" name="cpassword" placeholder="">
            </div>
        </div>
        <input type="submit" value="Tambahkan sebagai Anggota" class="ui black button">
    </form>
</div>
<script>
$('.ui.form')
  .form({
    fields: {
      nama: {
        rules: [
          {
            type   : 'empty',
            prompt : 'Dimohon mengisi nama anggota'
          }
        ]
      },
      alamat: {
        rules: [
          {
            type   : 'empty',
            prompt : 'Dimohon mengisi alamat anggota'
          }
        ]
      },
      telp: {
        rules: [
          {
            type   : 'empty',
            prompt : 'Dimohon mengisi nomor telepon anggota '
          }
        ]
      },
      email: {
        rules: [
          {
            type   : 'empty',
            prompt : 'Dimohon mengisi alamat email anggota'
          }
        ]
      },
      password: {
        rules: [
          {
            type   : 'empty',
            prompt : 'Dimohon mengisi password untuk akun anggota'
          }
        ]
      }
    }
  })
;
</script>
{% endblock %}
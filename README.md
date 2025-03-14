# Tutorial 3

## Fitur-Fitur yang Diimplementasikan

### 1. Double Jump

Memungkinkan karakter untuk melompat dua kali sebelum menyentuh tanah.

### 2. Dash

Memungkinkan karakter untuk bergerak cepat dalam arah yang diinginkan selama beberapa saat.

### 3. Crouch

Memungkinkan karakter untuk merunduk, berguna untuk menghindari rintangan atau masuk ke area sempit.

---

## Deskripsi Fitur

### Double Jump

-   Memungkinkan pemain melakukan lompatan tambahan di udara untuk mencapai platform yang lebih tinggi atau menghindari rintangan.
-   Implementasi dalam `player.gd` menggunakan variabel `jump_count` untuk membatasi lompatan hanya dua kali sebelum menyentuh tanah.

### Dash

-   Memberikan dorongan kecepatan ke arah tertentu, berguna untuk menghindari serangan atau melewati celah dengan cepat.
-   Implementasi dalam `player.gd` menggunakan variabel `is_dashing`, `dash_timer`, dan `dash_cooldown_timer` untuk mengatur mekanisme dash dan cooldown-nya.

### Crouch

-   Digunakan untuk merunduk agar karakter bisa melewati area rendah atau menghindari proyektil.
-   Implementasi dalam `player.gd` mengubah skala karakter (`scale`) saat tombol crouch ditekan.

---

## Implementasi di Godot

### Double Jump

1. Tambahkan variabel `jump_count` untuk melacak jumlah lompatan.
2. Saat tombol lompat ditekan (`ui_up`), periksa apakah `jump_count` kurang dari 2.
3. Jika iya, atur `velocity.y = jump_speed` dan tambahkan nilai `jump_count`.
4. Set `jump_count = 0` kembali saat karakter menyentuh tanah.

### Dash

1. Tambahkan variabel `is_dashing`, `dash_timer`, dan `dash_cooldown_timer`.
2. Saat pemain menekan tombol kiri (`ui_left`) atau kanan (`ui_right`), periksa apakah cooldown sudah habis.
3. Jika ya, atur `dash_timer = dash_duration` dan set `is_dashing = true`.
4. Gunakan `dash_timer` untuk sementara meningkatkan kecepatan karakter (`velocity.x = dash_speed`).
5. Setelah dash selesai, set kembali kecepatan normal.

### Crouch

1. Saat tombol `ui_down` ditekan, ubah `scale` karakter menjadi lebih kecil.
2. Saat tombol dilepas, kembalikan `scale` ke ukuran normal.
3. Kecepatan gerak dikurangi selama crouch aktif.

---

# Tutorial 5

## Fitur-Fitur yang Diimplementasikan

### 1. Sprite Animation

Memungkinkan karakter untuk memiliki animasi dalam berbagai kondisi.

### 2. Sounds

Memungkinkan game untuk memutar media berupa suara.

---

## Implementasi di Godot

### Sprite Animation

1. Pemain memiliki animasi untuk berbagai kondisi, contohnya adalah ketika diam yaitu idle dan berjalan yaitu walk.

### Sounds

1. Akan terdapat sound effect yang diputar ketika pemain meraih sebuah kunci.
2. Terdapat juga background sound yang diputar selama permainan berjalan.

---

## Referensi

1. [Forum Godot: Modular 2D Platformer Movement](https://forum.godotengine.org/t/godot-4-modular-2d-platformer-movement/45870)
2. [Dokumentasi Godot: 2D Movement](https://docs.godotengine.org/en/stable/tutorials/2d/2d_movement.html)
3. [CSUI Gamedev Website - Tutorial 5](https://csui-game-development.github.io/tutorials/tutorial-5/)

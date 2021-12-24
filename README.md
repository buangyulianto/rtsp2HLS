Ini adalah dokumentasi pribadi bagaimana cara untuk menayangkan tampilan live dari cctv yang ada di dalam ruangan ke perangkat yang terhubung ke jaringan.

Latar belakang masalah:
==
Adanya kebutuhan untuk melihat kondisi ruangan secara realtime dari perangkat yang tersedia meskipun saat kita berada diluar ruangan. Dalam percobaan kali ini kita akan dapat melihat kondisi ruangan dari browser pada perangkat mobile.

Topologi:
==
Kamera - DVR - Switch jaringan - Laptop
                   |
                  VM</br>
Spesifikasi:
==
<li>Laptop Acer swift 3, core i7 1,8GHz, 8GB RAM, 1TB SSD, LAN terhubung ke jaringan
<li>VM Linux Ubuntu 18.04_x64, 4vCPU, 4GB RAM, 20GB HDD, bridge LAN
<li>Perangkat DVR SPC

Requirements:
==
<li>Mengetahui dasar jaringan
<li>Mengetahui dasar perintah linux
<li>Memiliki akses ke perangkat DVR
<li>Memiliki URL RTSP dari perangkat DVR. Dalam hal ini sebagai contoh rtsp://admin:passworddvr@10.21.0.14:554/mode=real&idc=6&ids=1
<li>Keterangan:
  - Protokol: RTSP
  - Username: admin
  - Password: passworddvr
  - IP address DVR: 10.21.0.15
  - Port RTSP: 554
  - ID kamera: idc=6
  - Mode kamera: ids=1 (1 merupakan kode untuk stream, 2 untuk substream)

Step-by-step:
==
VM yang terhubung ke jaringan bisa menggunakan alat yang terpisah atau jadi satu dengan laptop yang terinstall pada aplikasi virtualbox.
  <h3>Test rtsp url diatas pada VLC player terlebhi dahulu</h3>
  <li>Install VLC player pada windows
  <li>Klik menu Media > Open Network Stream
  <li>Masukan Network URL rtsp diatas
  <li>Kesimpulan: Jika video tampil pada player VLC maka alamat rtsp diatas sudah benar dan siap di uji cobakan pada proses berikutnya.
<h3>Menyiapkan VM sebagai server RTSP dan konverter ke HLS supaya dapat diakses pada browser</h3>
<li>Install apps virtualbox
<li>Create new VM Linux Ubuntu 18.04 dengan spesifikasi yang telah ditentukan diatas
<li>Install Sistem Operasi Linux Ubuntu
<li>Gunakan IP address statis 10.21.0.19 (silakan menyesuaikan dengan jaringan masing2)
<li>Lakukan update dengan perintah sudo apt update && dist-upgrade
<li>reboot
<li>Login ke VM
<li>Copy semua file dari halaman ini ke VM dengan path /opt, bisa dengan menggunakan wincp atau git dengan perintah git clone https://github.com/buangyulianto/rtsp2HLS.git
<li>Edit file rtsp-simple-server.yml dan sesuaikan isinya dengan kondisi masing2
<br>Tampak code yang aktif untuk kamera 6 saja karena sifatnya hanyalah testing, meskipun jika pada DVR terdapat lebih dari satu kamera tetap dapat diproses dengan konsekuensi resource CPU yang meningkat.</br>
<code>cam6:
<ul><code>source: rtsp://admin:passworddvr@10.21.0.14:554/mode=real&idc=6&ids=1</ul>
<li>

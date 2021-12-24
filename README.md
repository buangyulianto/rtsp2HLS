Ini adalah dokumentasi pribadi bagaimana cara untuk menayangkan tampilan live dari cctv yang ada di dalam ruangan ke perangkat yang terhubung ke jaringan.

Latar belakang masalah:
==
Adanya kebutuhan untuk melihat kondisi ruangan secara realtime dari perangkat yang tersedia meskipun saat kita berada diluar ruangan. Dalam percobaan kali ini kita akan dapat melihat kondisi ruangan dari browser pada perangkat mobile.

Topologi:
==
<text>Kamera - DVR - Switch jaringan - Laptop
                            |
                           VM
  
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
  <br>Protokol: RTSP
  <br>Username: admin
  <br>Password: passworddvr
  <br>IP address DVR: 10.21.0.14
  <br>Port RTSP: 554
  <br>ID kamera: idc=6
  <br>Mode kamera: ids=1 (1 merupakan kode untuk stream, 2 untuk substream)

Step-by-step:
==
VM yang terhubung ke jaringan bisa menggunakan alat yang terpisah atau jadi satu dengan laptop yang terinstall pada aplikasi virtualbox.
  <h3>Test rtsp url diatas pada VLC player terlebih dahulu</h3>
  <li>Install VLC player pada windows
  <li>Klik menu Media > Open Network Stream
  <li>Masukan Network URL rtsp diatas
  <li>Kesimpulan: jika video tampil pada VLC player maka alamat rtsp diatas sudah benar dan siap di uji cobakan pada proses berikutnya.
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
  <ul>source: rtsp://admin:passworddvr@10.21.0.14:554/mode=real&idc=6&ids=1</code></ul>
<br>Arti kode:
  <br>Pada kode diatas akan merubah url aslinya rtsp://admin:passworddvr@10.21.0.14:554/mode=real&idc=6&ids=1 menjadi url baru rtsp://10.21.0.19:8554/cam6 sesuai konfigurasi pada file rtsp-simple.server.yml
<li>Jalankan file rtsp-simple-server dengan mengetik ./rtsp-simple-server dan biarkan proses ini tetap berjalan
<li>Lakukan test url rtsp baru dengan menggunakan VLC player seperti langkah sebelumnya
<br>Kesimpulan: jika video tampil pada VLC player maka proses perubahan alamat rtsp diatas sudah benar dan siap diroses untuk konversi menjadi format HLS
  <h3>Konversi RTSP ke HLS</h3>
  <li>edit file stream/cam6.sh
  <li>lakukan koreksi pada rtst url dan sesuaikan dengan masing2
  <br><code>ffmpeg -rtsp_transport tcp -i rtsp://10.21.0.19:8554/cam6 -c:v libx264 -preset ultrafast -pix_fmt yuv420p -tune zerolatency -b:v 900k -max_muxing_queue_size 1024 -maxrate 750k -bufsize 3000k -f hls -hls_time 1 -segment_time 5 -hls_list_size 3 -hls_flags delete_segments -hls_allow_cache 0 /opt/cam6.m3u8</code>
<br>Arti kode
    <br>Kode diatas merupakan proses merubah sumber video dengan protokol RTSP menjadi HLS dan akan menyimpannya ke folder /opt/cam6.m3u8 dimana nanti di dalam folder /opt akan ada file baru dengan extensi .ts dan .m3u8. File dengan extensi .m3u8 ini yang nanti bisa kita panggil dari halaman html.
  <li>Jalankan file streamnow.sh dengan mengetik ./streamnow.sh dan biarkan proses kedua ini tetap berjalan
    <h3>Menampilkan video pada browser</h3>
    <li>Install apache web server pada VM dengan perintah apt install apache2
    <li>Lakukan test apakah apache sudar berjalan dengan cara buka browser dan buka alamat IP VM http://10.21.0.19
    <li>Kesimpulan: jika muncul tampilan apache webserver berarti siap untuk proses selanjutnya
    <li>Rename folder original dengan perintah mv /var/www/html /var/www/html-orig
    <li>Buat link html baru dengan perintah ln -s /opt /var/www/html
    <li>Lakukan modifikasi pada halaman /opt/index.html seperlunya sebelum melakukan test dibawah
    <li>Lakukan test apakah halaman index.html sudah berjalan dengan cara buka browser dan buka alamat IP VM http://10.21.0.19
    <li>Kesimpulan: jika muncul halaman index dengan tombol video yang bisa di play maka semua konfigurasi telah sesuai.

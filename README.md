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
Laptop Acer swift 3, core i7 1,8GHz, 8GB RAM, 1TB SSD, LAN terhubung ke jaringan
VM Linux Ubuntu 18.04_x64, 4vCPU, 4GB RAM, 20GB HDD, bridge LAN

Requirements:
==
<li>Mengetahui dasar jaringan
<li>Mengetahui dasar perintah linux
<li>Memiliki akses ke perangkat DVR

Step-by-step:
==
VM yang terhubung ke jaringan bisa menggunakan alat yang terpisah atau jadi satu dengan laptop yang terinstall pada aplikasi virtualbox.
<li>Install apps virtualbox</li>
<li>Create new VM Linux Ubuntu 18.04 dengan spesifikasi yang telah ditentukan diatas
<li>Install Sistem Operasi Linux Ubuntu
<li>Gunakan IP address statis 10.21.0.19 (silakan menyesuaikan dengan jaringan masing2)
<li>Lakukan update dengan perintah sudo apt update && dis-upgrade
<li>reboot
<li>Login ke VM
<li>

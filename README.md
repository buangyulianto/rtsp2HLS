Ini adalah dokumentasi pribadi bagaimana cara untuk menayangkan tampilan live dari cctv yang ada di dalam ruangan ke perangkat yang terhubung ke jaringan.

Latar belakang masalah:
==
Adanya kebutuhan untuk melihat kondisi ruangan secara realtime dari perangkat yang tersedia meskipun saat kita berada diluar ruangan. Dalam percobaan kali ini kita akan dapat melihat kondisi ruangan dari browser pada perangkat mobile.

Topologi:
==
Kamera - DVR - Switch jaringan - Laptop
                   |
                  VM
Spesifikasi:
==
Laptop Acer swift 3, core i7 1,8GHz, 8GB RAM, 1TB SSD, LAN terhubung ke jaringan
VM Linux Ubuntu 18.04_x64, 4vCPU, 4GB RAM, 20GB HDD, bridge LAN

Requirements:
==
Mengetahui dasar jaringan
Mengetahui dasar perintah linux
Memiliki akses ke perangkat DVR

Step-by-step:
==
VM yang terhubung ke jaringan bisa menggunakan alat yang terpisah atau jadi satu dengan laptop yang terinstall pada aplikasi virtualbox.
Install apps virtualbox
Create new VM Linux Ubuntu 18.04 dengan spesifikasi yang telah ditentukan diatas
Install Sistem Operasi Linux Ubuntu
Gunakan IP address statis 10.21.0.19 (silakan menyesuaikan dengan jaringan masing2)
Lakukan update dengan perintah sudo apt update && dis-upgrade
reboot
Login ke VM

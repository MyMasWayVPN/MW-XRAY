<p align="center">
<img src="https://readme-typing-svg.herokuapp.com?color=%2336BCF7&center=true&vCenter=true&lines=SCRIPT+XRAY+MultiPort+443/80" />
</p>

# XRAY 
- ***Script XRAY Multi Port 443/80 By MasWayVPN***
- ***SCRIPT UNTUK MEMBUAT SERVER VPN***

#

# FITUR XRAY TLS
- TROJAN WS        : **443**
- TROJAN GRPC      : **443**
- SHADOWSOCKS WS   : **443**
- SHADOWSOCKS GRPC : **443**
- VMESS WS         : **443**
- VMESS GRPC       : **443**
- VLESS WS         : **443**
- VLESS GRPC       : **443**

# FITUR XRAY HTTP
- TROJAN WS        : **80**
- TROJAN GRPC      : **80**
- SHADOWSOCKS WS   : **80**
- SHADOWSOCKS GRPC : **80**
- VMESS WS         : **80**
- VMESS GRPC       : **80**
- VLESS WS         : **80**
- VLESS GRPC       : **80**

# OS 
- Debian 9 (HVM)
- Debian 10
* Berhasil di gunakan di vps aws dan os debian 9 hvm
* untuk vps isp yg lain saya tidak tau, dan os yg lain juga saya tidak tau wkwk

# Syarat && Bahan Untuk Menggunakan Script Ini
- Wajib Punya VPS
- Wajib Punya Akun Cloudflare
- Wajib Punya Domain Punya Kamu Sendiri
- ***Jika semua syarat dan Bahan sudah terpenuhi ,silahkan di coba script ini***

1. Update Dulu VPS NYA

```
apt-get update && apt-get upgrade -y && update-grub && sleep 2 && reboot
```
- Otomatis Akan Reboot/ Hidupkan Ulang
2. Login Lagi Ke VPS NYA
3. Salin kode di bawah ini dan paste kan ke dalam vps punya kamu
- maka proses install akan berjalan, jangan keluar dari vps
- jika keluar dari vps saat lagi proses install,maka akan gagal
```
wget https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/ip.sh && chmod +x ip.sh && ./ip.sh
```
4. jika sudah selesai,lalu ketik xmenu untuk menampilkan menu

5. DONE / SELESAI

# Info Perbaiki / FIX
- ***NOTE***
- jika xray dan nginx mengalami error !
- ketik
```
certv2ray
```
lalu ketik
```
restart-xray
```

# INFO KODE SCRIPT
- xmenu (untuk menampilkan menu
- updatedll (untuk update sc)
- restart-xray (hidupkan ulang xray)
- certv2ray (Perbarui Sertifikat / Update Certificate)

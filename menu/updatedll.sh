#!/bin/bash
# ==========================================
MYIP=$(curl -sS ipv4.icanhazip.com)
echo "Checking VPS"
#########################
IZIN=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
cd
rm -r updatedll
wget -O updatedll "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/updatedll.sh"
rm -rf updatedll

# hapus
cd /usr/bin
rm -rf xmenu
rm -rf updatedll
rm -r updatedll
# download
#
cd /usr/bin
wget -O xmenu "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/xmenu.sh"
wget -O add-akun "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/add-akun.sh"
wget -O updatedll "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/updatedll.sh"
wget -O add-akun "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/add-akun.sh"
wget -O delete-akun "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/delete-akun.sh"
wget -O certv2ray "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/xray/certv2ray.sh"
wget -O restart-xray "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/restart-xray.sh"
wget -O xmenu "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/xmenu.sh"
wget -O auto-pointing "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/auto-pointing.sh"
wget -O cek-port "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/cek-port.sh"
wget -O xmenu "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/xmenu.sh"
wget -O running "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/running.sh"

#
chmod +x /usr/bin/updatedll
chmod +x /usr/bin/xmenu
chmod +x xmenu
chmod +x add-akun
chmod +x running
chmod +x delete-akun
chmod +x updatedll
chmod +x add-akun
chmod +x /usr/bin/certv2ray
chmod +x certv2ray
./certv2ray
chmod +x restart-xray
./restart-xray
chmod +x auto-pointing
chmod +x cek-port

cd

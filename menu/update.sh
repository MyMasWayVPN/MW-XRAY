#!/bin/bash
# ==========================================
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
cd
rm -r update
wget -O update "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/update.sh"
rm -rf update

# hapus
cd /usr/bin
rm -rf menu
rm -rf update
rm -r update
# download
#
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/menu.sh"
wget -O add-akun "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/add-akun.sh"
wget -O update "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/update.sh"
wget -O add-akun "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/add-akun.sh"
wget -O delete-akun "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/delete-akun.sh"
wget -O certv2ray "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/xray/certv2ray.sh"
wget -O restart-xray "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/restart-xray.sh"
wget -O menu "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/menu.sh"
wget -O infoxxx "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/infoxxx.sh"
wget -O add-host "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/add-host.sh"
#wget -O cek-port "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/cek-port.sh"
wget -O menu "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/menu.sh"
wget -O running "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/running.sh"

#
chmod +x /usr/bin/update
chmod +x /usr/bin/menu
chmod +x infoxxx
chmod +x menu
chmod +x add-akun
chmod +x running
chmod +x delete-akun
chmod +x update
chmod +x add-akun
chmod +x /usr/bin/certv2ray
chmod +x certv2ray
chmod +x restart-xray
chmod +x add-host
#chmod +x cek-port

cd

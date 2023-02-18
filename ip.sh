#!/bin/bash

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

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
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}
# https://raw.githubusercontent.com/apih46/access/main/ip 
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
res="Perizinan Diberikan..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res= "Permission Denied!"
    fi
    BURIQ
}
clear
PERMISSION
if [ "$res" = "Permission Accepted..." ]; then
green "Permission Accepted.."
else
red "Permission Denied!"
exit 0
clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
mkdir /var/lib/crot;
echo "IP=" >> /var/lib/crot/ipvps.conf
cd
#install tools/alat
wget https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/install-tools.sh && chmod +x install-tools.sh && ./install-tools.sh
#
wget https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/auto-pointing.sh && chmod +x auto-pointing.sh && ./auto-pointing.sh
#
#Instal Xray
wget https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/install-xray.sh && chmod +x install-xray.sh && ./install-xray.sh
#install xmenu
wget https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/updatedll.sh && chmod +x updatedll.sh && ./updatedll.sh
#
#SELESAI
echo " "
echo "Installation has been completed!!"echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"  | tee -a log-install.txt
echo -e "    SCRIPT MANTAP-XRAY Multi Port"  | tee -a log-install.txt
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - Nginx                      : 89"  | tee -a log-install.txt
echo "   - XRAYS TROJAN WS TLS        : 443"  | tee -a log-install.txt
echo "   - XRAYS SHADOWSOCKS WS TLS   : 443"  | tee -a log-install.txt
echo "   - XRAYS VLESS WS TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS VMESS WS TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS TROJAN WS HTTP       : 80"  | tee -a log-install.txt
echo "   - XRAYS SHADOWSOCKS WS HTTP  : 80"  | tee -a log-install.txt
echo "   - XRAYS VLESS WS HTTP        : 80"  | tee -a log-install.txt
echo "   - XRAYS VMESS WS HTTP        : 80"  | tee -a log-install.txt
echo "   - XRAYS TROJAN GRPC          : 443"  | tee -a log-install.txt
echo "   - XRAYS SHADOWSOCKS GRPC     : 443"  | tee -a log-install.txt
echo "   - XRAYS VMESS GRPC           : 443"  | tee -a log-install.txt
echo "   - XRAYS VLESS GRPC           : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo " Reboot 15 Sec"
sleep 15
cd
rm -rf updatedll
rm -rf updatedll.sh
rm -rf ip.sh
rm -rf install-xray.sh
rm -rf install-tools.sh

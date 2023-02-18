#!/bin/bash
# ==========================================
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
wget -O certv2ray "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/xray/certv2ray.sh"
wget -O restart-xray "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/restart-xray.sh"
wget -O xmenu "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/xmenu.sh"
wget -O auto-pointing "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/auto-pointing.sh"
wget -O cek-port "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/cek-port.sh"
wget -O xmenu "https://raw.githubusercontent.com/MyMasWayVPN/MW-XRAY/main/menu/xmenu.sh"

#
chmod +x /usr/bin/updatedll
chmod +x /usr/bin/xmenu
chmod +x xmenu
chmod +x add-akun
chmod +x delete-akun
chmod +x updatedll
chmod +x add-akun
chmod +x certv2ray
chmod +x restart-xray
chmod +x auto-pointing
chmod +x cek-port

cd

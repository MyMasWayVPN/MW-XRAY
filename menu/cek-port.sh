#!/bin/bash
# Script by SL
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
xrayport="$(netstat -ntlp | grep -i xray | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
nginxport="$(netstat -ntlp | grep -i nginx | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
sslhport="$(netstat -ntlp | grep -i sslh | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
sldnsport="$(netstat -ntlp | grep -i sldns-client | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
wsport="$(netstat -ntlp | grep -i python | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
opensshport="$(netstat -ntlp | grep -i ssh | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
dropbearport="$(netstat -nlpt | grep -i dropbear | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
stunnelport="$(netstat -nlpt | grep -i stunnel | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
openvpnport="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
#squidport="$(netstat -nlpt | grep -i squid | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
squidport=OFF
nodeproxyport=OFF
udpgwport="$(netstat -nlpt | grep -i badvpn-udpgw | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
echo -e "\e[0m                                                   "
echo -e "\e[1;31m     [*][*][*]======================================[*][*][*]"
echo -e "\e[0m                                                   "
echo -e "\e[0;37m                    Auto Script XRAY by MASWAY   "
echo -e "\e[0;37m                    Port Yang Sedang Aktif      "
echo -e "\e[0;37m                    Service Port                "
echo -e "\e[0m                                                   "
echo -e "\e[0;37m                    Port Nginx      :  "$nginxport
echo -e "\e[0;37m                    Port Xray       :  "$xrayport
echo -e "\e[0;37m                    Port SlowDNS    :  "$sldnsport
echo -e "\e[0;37m                    Port OpenSSH    :  "$opensshport
echo -e "\e[0;37m                    Port Dropbear   :  "$dropbearport
echo -e "\e[0;37m                    Port Stunnel    :  "$stunnelport
echo -e "\e[0;37m                    Port SSLH       :  "$sslhport
echo -e "\e[0;37m                    Port Websocket  :  "$wsport
echo -e "\e[0;37m                    Port OpenVPN    :  "$openvpnport
echo -e "\e[0;37m                    Port UDPGW      :  "$udpgwport
echo -e "\e[0;37m                    Port Squid      :  "$squidport
echo -e "\e[0;37m                    Port CloudFront :  "$nodeproxyport
echo -e "\e[0m                                                   "
echo -e "\e[0;37m                    * Info                      "
echo -e "\e[0;37m                    * Jika port nya tidak muncul"
echo -e "\e[0;37m                    * berarti port nya mati/OFF "
echo -e "\e[0m                                                   "
echo -e "\e[1;31m     [*][*][*]======================================[*][*][*]"
echo ""
read -sp " Press ENTER to go back"
echo ""

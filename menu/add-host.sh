#!/bin/bash
# My Telegram : https://t.me/zerossl
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
clear
# ==========================================
echo "IP=" >> /var/lib/crot/ipvps.conf
echo -e "==================================================" | lolcat
echo -e   "\E[44;1;39m          ⇱ Select Your Domain ⇲                      \E[0m"
echo -e   "\E[44;1;39m            ⇱ SC VPS PREMIUM ⇲                    \E[0m"
echo -e "=================================================="  | lolcat
echo -e   "[${GREEN} 01 ${NC}]. •mwvpn.tech"
echo -e   "[${GREEN} 02 ${NC}]. •indossh.ninja"
echo -e   "[${GREEN} 03 ${NC}]. •indossh.me"
echo -e   "[${GREEN} 04 ${NC}]. •masway-vpn.my.id"
echo -e   "[${GREEN} 05 ${NC}]. •myindossh.tech"
echo -e   "[${GREEN} 06 ${NC}]. •nextvpn.xyz"
echo -e "==================================================" | lolcat
read -p   "Select From Options [ 1 - 6 ] : " domen
echo -e  ""
case $domen in
1)
clear
echo -e "==================================================" | lolcat
echo -e   "\E[44;1;39m        ⇱ Your Select SubDomain ⇲                      \E[0m"
echo -e   "\E[44;1;39m             ⇱ mwvpn.tech ⇲                    \E[0m"
echo -e "=================================================="  | lolcat
sleep 4
wget https://raw.githubusercontent.com/MyMasWayVPN/v3/main/domen/mwvpn.sh && chmod +x mwvpn.sh && screen -S mwvpn ./mwvpn.sh
;;
2)
clear
echo -e "==================================================" | lolcat
echo -e   "\E[44;1;39m        ⇱ Your Select SubDomain ⇲                      \E[0m"
echo -e   "\E[44;1;39m            ⇱ indossh.ninja ⇲                    \E[0m"
echo -e "=================================================="  | lolcat
sleep 4
wget https://raw.githubusercontent.com/MyMasWayVPN/v3/main/domen/indosshninja.sh && chmod +x indosshninja.sh && screen -S indosshninja ./indosshninja.sh
;;
3)
clear
echo -e "==================================================" | lolcat
echo -e   "\E[44;1;39m        ⇱ Your Select SubDomain ⇲                      \E[0m"
echo -e   "\E[44;1;39m             ⇱ indossh.me ⇲                    \E[0m"
echo -e "=================================================="  | lolcat
sleep 4
wget https://raw.githubusercontent.com/MyMasWayVPN/v3/main/domen/indosshme.sh && chmod +x indosshme.sh && screen -S indosshme ./insshme.sh
;;
4)
clear
echo -e "==================================================" | lolcat
echo -e   "\E[44;1;39m        ⇱ Your Select SubDomain ⇲                      \E[0m"
echo -e   "\E[44;1;39m           ⇱ masway-vpn.my.id ⇲                    \E[0m"
echo -e "=================================================="  | lolcat
sleep 4
wget https://raw.githubusercontent.com/MyMasWayVPN/v3/main/domen/maswayvpn.sh && chmod +x maswayvpn.sh && screen -S maswayvpn ./maswayvpn.sh
;;
5)
clear
echo -e "==================================================" | lolcat
echo -e   "\E[44;1;39m        ⇱ Your Select SubDomain ⇲                      \E[0m"
echo -e   "\E[44;1;39m            ⇱ myindossh.tech ⇲                    \E[0m"
echo -e "=================================================="  | lolcat
sleep 4
wget https://raw.githubusercontent.com/MyMasWayVPN/v3/main/domen/myindossh.sh && chmod +x myindossh.sh && screen -S myindossh ./myindossh.sh
;;
6)
clear
echo -e "==================================================" | lolcat
echo -e   "\E[44;1;39m        ⇱ Your Select SubDomain ⇲                      \E[0m"
echo -e   "\E[44;1;39m             ⇱ nextvpn.xyz ⇲                    \E[0m"
echo -e "=================================================="  | lolcat
sleep 4
wget https://raw.githubusercontent.com/MyMasWayVPN/v3/main/domen/nextvpn.sh && chmod +x nextvpn.sh && screen -S nextvpn ./nextvpn.sh
;;
esac


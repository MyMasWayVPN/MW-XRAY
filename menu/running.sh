#!/bin/bash
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
# Getting
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
if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $3}')
fi
Domen="$(cat /etc/xray/domain)"
Name=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $2}')
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "  $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

today=`date -d "0 days" +"%Y-%m-%d"`

# CERTIFICATE STATUS
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
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
MYIP=$(curl -sS ipv4.icanhazip.com)
clear

# GETTING OS INFORMATION
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# VPS ISP INFORMATION
#ITAM='\033[0;30m'
echo -e "$ITAM"
#REGION=$( curl -s ipinfo.io/region )
#clear
#COUNTRY=$( curl -s ipinfo.io/country )
#clear
#WAKTU=$( curl -s ipinfo.ip/timezone )
#clear
CITY=$( curl -s ipinfo.io/city )
#clear
#REGION=$( curl -s ipinfo.io/region )
#clear

# CHEK STATUS 
status_openvpn=$(/etc/init.d/openvpn status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_status=$(systemctl status xray | grep Active | awk '{print $0}' | cut -d "(" -f2 | cut -d ")" -f1) 
nginx_status=$(systemctl status nginx | grep Active | awk '{print $0}' | cut -d "(" -f2 | cut -d ")" -f1) 
runn_status="$(systemctl status runn | grep Active | awk '{print $0}' | cut -d "(" -f2 | cut -d ")" -f1) 
status_dropbear=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
status_stunnel4=$(/etc/init.d/stunnel5 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
status_vnstat=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
status_ssh=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
status_fail2ban=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

wstls=$(systemctl status ws-tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsdrop=$(systemctl status ws-nontls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsovpn=$(systemctl status ws-ovpn | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#wsopen=$(systemctl status ws-openssh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
osslh=$(systemctl status sslh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohp=$(systemctl status dropbear-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohq=$(systemctl status openvpn-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohr=$(systemctl status ssh-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# COLOR VALIDATION
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear

# STATUS SERVICE XRAY
if [[ $xray_status == "running" ]]; then
  status_xray=" ${GREEN}Running ${NC}( No Error )"
else
  status_xray="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE NGINX
if [[ $nginx_status == "running" ]]; then 
   status_nginx=" ${GREEN}Running ${NC}( No Error )"
else
   status_nginx="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE RUN
if [[ $runn_status == "active" ]]; then
  status_runn=" ${GREEN}Running ${NC}( No Error )"
else
  status_runn="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE OPENVPN
if [[ $status_openvpn == "active" ]]; then
  openvpn_status=" ${GREEN}Running ${NC}( No Error )"
else
  openvpn_status="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE SSH
if [[ $status_ssh == "active" ]]; then
  ssh_status=" ${GREEN}Running ${NC}( No Error )"
else
  ssh_status="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE FAIL2BAN
if [[ $status_fail2ban == "active" ]]; then
  fail2ban_status=" ${GREEN}Running ${NC}( No Error )"
else
  fail2ban_status="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE DROPBEAR
if [[ $status_dropbear == "active" ]]; then
  dropbear_status=" ${GREEN}Running ${NC}( No Error )"
else
  dropbear_status="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE STUNNEL4
if [[ $status_stunnel4 == "active" ]]; then
  stunnel4_status=" ${GREEN}Running ${NC}( No Error )"
else
  stunnel4_status="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE VNSTAT
if [[ $status_vnstat == "active" ]]; then
  vnstat_status=" ${GREEN}Running ${NC}( No Error )"
else
  vnstat_status="${RED}  Not Running ${NC}  ( Error )"
fi


# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

# TIPE PROCESSOR
#totalcore="$(grep -c "^processor" /proc/cpuinfo)" 
#totalcore+=" Core"
#corediilik="$(grep -c "^processor" /proc/cpuinfo)" 
#tipeprosesor="$(awk -F ': | @' '/model name|Processor|^cpu model|chip type|^cpu type/ {
  #                      printf $2;
      #                  exit
    #                    }' /proc/cpuinfo)"

# GETTING CPU INFORMATION
#cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
#cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
#cpu_usage+=" %"

# OS UPTIME
#uptime="$(uptime -p | cut -d " " -f 2-10)"

# KERNEL TERBARU
kernelku=$(uname -r)

# WAKTU SEKARANG 
#harini=`date -d "0 days" +"%d-%m-%Y"`
#jam=`date -d "0 days" +"%X"`

# DNS PATCH
#tipeos2=$(uname -m)

# GETTING DOMAIN NAME
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m              ⇱ Sytem Information ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " ❇️ Client Name    : $Name"
echo -e " ❇️ Expired Script     : $certificate Days"
echo -e " ❇️ Public IP   : $MYIP"
echo -e " ❇️ Domain      : $Domen"
echo -e " ❇️ Version     : Latest Version"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ Service Information ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " ❇️ VMESS                :$status_xray"
echo -e " ❇️ VLESS           :$status_xray"
echo -e " ❇️ TROJAN WS           :$status_xray"
echo -e " ❇️ SHADOWSOCKS            :$status_xray"
echo -e " ❇️ NGINX              :$status_nginx"
echo -e " ❇️ RUNN               :$status_runn"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo ""
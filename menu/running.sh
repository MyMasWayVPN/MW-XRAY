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

MYIP=$(curl -sS ipv4.icanhazip.com)
echo "Checking VPS"
#########################
IZIN=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
sleep2
clear
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
#EXPIRED
expired=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $3}')
echo $expired > /root/expired.txt
today=$(date -d +1day +%Y-%m-%d)
while read expired
do
	exp=$(echo $expired | curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $3}')
	if [[ $exp < $today ]]; then
		Exp2="\033[1;31mExpired\033[0m"
        else
        Exp2=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $3}')
	fi
done < /root/expired.txt
rm /root/expired.txt
Name=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $2}')
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
Domen="$(cat /etc/xray/domain)"
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m              ⇱ Sytem Information ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ Hostname    : $HOSTNAME"
echo -e "❇️ OS Name     : $Tipe"
#echo -e "Processor   : $tipeprosesor"
#echo -e "Proc Core   :$totalcore"
#echo -e "Virtual     :$typevps"
#echo -e "Cpu Usage   :$cpu_usage"
echo -e "❇️ Total RAM   : ${totalram}MB"
echo -e "❇️ Public IP   : $MYIP"
echo -e "❇️ Domain      : $Domen"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ Subscription Information ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ Client Name : $Name"
echo -e "❇️ Exp Script  : $Exp2"
echo -e "❇️ Version     : Latest Version"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ Service Information ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ SSH                :$status_ssh"
echo -e "❇️ DROPBEAR           :$status_dropbear"
echo -e "❇️ STUNNEL4           :$status_stunnel4"
echo -e "❇️ OPENVPN            :$status_openvpn"
echo -e "❇️ FAIL2BAN           :$status_fail2ban"
echo -e "❇️ VNSTAT             :$status_vnstat"
echo -e "❇️ XRAY               :$status_xray"
echo -e "❇️ NGINX              :$status_nginx"
echo -e "❇️ RUNN               :$status_runn"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo ""

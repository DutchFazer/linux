#!/bin/bash
# Script voor een kale machine.
# Plaats hem in de user folder en geef hem uitvoerrechten.
# Download eerst Burp van de website!!!

C=$(printf '\033')
RED="${C}[1;31m"

echo "${RED}==============================================================
${RED}*                      BELANGRIJK                            *
${RED}* Burp Suite:                                                *
${RED}* Eerst downloaden voordat je het script start!              *
${RED}*                                                            *
${RED}=============================================================="

sudo apt install nmap git john sqlmap curl default-jre wireshark &&

git clone https://gitlab.com/kalilinux/packages/dirbuster.git \
  && sudo mv dirbuster /opt/dirbuster \
  && echo "alias dirbuster='source /opt/dirbuster/DirBuster-1.0-RC1.sh'" > .bash_aliases \
  && chmod +x .bash_aliases \
  && ./.bash_aliases

wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip \
  && sudo unzip SecList.zip \
  && sudo mv Seclists-master /usr/share/seclist

chmod 755 Downloads/burpsuite_community_linux_v2022_1_1.sh \
  && ./Downloads/burpsuite_community_linux_v2022_1_1.sh

curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
   chmod 755 msfinstall && \
  ./msfinstall

wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_linux_amd64 \
  && mv linpeas_linux_amd64 linpeas \
  && chmod 755 linpeas \
  && sudo mv linpeas /opt/linpeas

sudo rm -r SecLists-master/ SecList.zip 

echo "${RED}==============================================================
${RED}* TO DO LIST                                                 *
${RED}* Dirbuster:                                                 *
${RED}* Verander het bestand /opt/dirbuster/DirBuster-1.0-RC1.sh   *
${RED}* Verander de locatie door /opt/dirbuster/ ervoor te zetten. *
${RED}*                                                            *
${RED}* Metasploit:                                                *
${RED}* Start msfconsole om hem verder te installeren              *
${RED}* Na installatie rm msfinstall                               *
${RED}*                                                            *
${RED}* FoxyProxy:                                                 *
${RED}* Downloaden via Firefox en installeren.                     *
${RED}*                                                            *
${RED}=============================================================="

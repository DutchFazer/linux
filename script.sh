#!/bin/bash
# Script voor een kale machine.
# Plaats hem in de user folder en geef hem uitvoerrechten.
# Download eerst Burp van de website!!!

echo "==============================================================
*                      BELANGRIJK                            *
* Burp Suite:                                                *
* Eerst downloaden voordat je het script start!              *
*                                                            *
=============================================================="

sudo apt install nmap john sqlmap curl default-jre wireshark &&

git clone https://gitlab.com/kalilinux/packages/dirbuster.git \
  && sudo mv dirbuster /opt/dirbuster \
  && echo "alias dirbuster='source /opt/dirbuster/DirBuster-1.0-RC1.sh'" > .bash_aliases \
  && chmod +x .bash_aliases \
  && ./.bash_aliases

wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip \
  && sudo unzip SecList.zip

chmod 755 Downloads/burpsuite_community_linux_v2022_1_1.sh \
  && ./Downloads/burpsuite_community_linux_v2022_1_1.sh

curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
   chmod 755 msfinstall && \
  ./msfinstall

wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_linux_amd64 \
  && mv linpeas_linux_amd64 linpeas \
  && chmod 755 linpeas \
  && sudo mv linpeas /opt/linpeas

sudo mv SecLists-master/ /usr/share/seclist

sudo rm -r SecList.zip linux Downloads/burpsuite_community_linux_v2022_1_1.sh

C=$(printf '\033')
RED="${C}[1;31m"

echo "${RED}==============================================================
* TO DO LIST                                                 *
* Dirbuster:                                                 *
* Verander het bestand /opt/dirbuster/DirBuster-1.0-RC1.sh   *
* Verander de locatie door /opt/dirbuster/ ervoor te zetten. *
*                                                            *
* Metasploit:                                                *
* Start msfconsole om hem verder te installeren              *
* Na installatie rm msfinstall                               *
*                                                            *
* FoxyProxy:                                                 *
* Downloaden via Firefox en installeren.                     *
*                                                            *
* Burp Suite:                                                *
* Certificaat aanmaken via Proxy options en deze importeren  *
* in Firefox via settings => certificaten                    *
=============================================================="

#!/usr/bin/env bash
# ----------------------------- VARIÁVEIS ----------------------------- #
PPA_GRAPHICS_DRIVERS="ppa:graphics-drivers/ppa"
#PPA_LUTRIS="ppa:lutris-team/lutris"

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_PPA_WINE="https://dl.winehq.org/wine-builds/ubuntu/"
#URL_SIMPLE_NOTE="https://github.com/Automattic/simplenote-electron/releases/download/v1.8.0/Simplenote-linux-1.8.0-amd64.deb"
#URL_INSYNC="https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.0.20.40428-bionic_amd64.deb"
URL_VAGRANT="https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.deb"
URL_TERRAFORM="https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip"
DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"
DIRETORIO_DOWNLOADS_ZIPADO="$HOME/Downloads/programas/terraform"
# ---------------------------------------------------------------------- #

# ----------------------------- REQUISITOS ----------------------------- #
## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Adicionando/Confirmando arquitetura de 32 bits ##
sudo dpkg --add-architecture i386

## Atualizando o repositório ##
sudo apt update -y

## Adicionando repositórios de terceiros e suporte a Snap (Lutris e Drivers Nvidia)##
sudo apt-add-repository "$PPA_GRAPHICS_DRIVERS" -y
#sudo add-apt-repository "$PPA_LUTRIS" -y
wget -nc "$URL_WINE_KEY"
sudo apt-key add winehq.key
sudo apt-add-repository "deb $URL_PPA_WINE bionic main"
# ---------------------------------------------------------------------- #

# ----------------------------- EXECUÇÃO ----------------------------- #
sudo apt install snapd -y

## Atualizando o repositório depois da adição de novos repositórios ##
sudo apt update -y

## Download e instalaçao de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"
#wget -c "$URL_SIMPLE_NOTE"         -P "$DIRETORIO_DOWNLOADS"
#wget -c "$URL_INSYNC"              -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_VAGRANT"             -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_TERRAFORM"           -P "$DIRETORIO_DOWNLOADS"     
## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

## Extração pacotes zipados
sudo unzip terraform_*.zip -d /usr/local/bin/

## Programas do repositório APT##
sudo apt install mint-meta-codecs -y
#sudo apt install guvcview -y
sudo apt install virtualbox -y
#sudo apt install flameshot -y
#sudo apt install nemo-dropbox -y
sudo apt install steam-installer steam-devices steam:i386 -y
#sudo apt install lutris libvulkan1 libvulkan1:i386 -y
sudo apt install git
sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y
sudo apt install libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386 -y
sudo apt install python3-pip -y

##Programas do repositorio PIP3
pip3 install ansible --no-cache-dir


##Configurando GIT
git config --global user.email "fabiohm2@gmail.com"
git config --global user.name "Fabio Henrique"

##Instalando pacotes Flatpak ##


## Instalando pacotes Snap ##
#sudo snap install slack --classic
sudo snap install skype --classic
sudo snap install pycharm-community --classic
sudo snap install code --classic
# ---------------------------------------------------------------------- #

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #

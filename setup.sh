#!/bin/bash

sudo dnf update -y

sudo dnf install nodejs npm -y

sudo dnf install discord -y

sudo dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.spotify.Client -y

flatpak install flathub com.bitwarden.desktop -y

sudo dnf install telegram-desktop -y

sudo dnf install steam -y

sudo dnf install lxrandr -y

sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/rpm/mullvad-keyring.asc
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
sudo wget -O /etc/yum.repos.d/mullvad.repo https://repository.mullvad.net/rpm/stable/mullvad.repo
sudo dnf install mullvad-vpn -y

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install code -y

flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community -y

flatpak install flathub com.jetbrains.WebStorm -y

flatpak install flathub com.parsecgaming.parsec -y

flatpak install flathub io.exodus.Exodus -y

flatpak install flathub com.termius.Termius -y

sudo dnf install obs-studio -y

sudo dnf install wine winetricks -y

sudo dnf install bottles -y

sudo dnf install lutris -y

sudo dnf install htop -y

sudo dnf install fastfetch -y

echo "setup complete"

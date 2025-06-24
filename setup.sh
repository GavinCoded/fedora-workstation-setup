#!/bin/bash
# update the system via dnf
sudo dnf update -y

# node js 
sudo dnf install nodejs npm -y

# discord
sudo dnf install discord -y

# flatpaks (we obv need this since its fedora LOL)
sudo dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client -y
flatpak install flathub com.bitwarden.desktop -y

# telegrams desktop electron application
sudo dnf install telegram-desktop -y

# steam for games
sudo dnf install steam -y

# Mainly needed for minecraft (minecraft 1.8 and other versions crash without this package)
sudo dnf install lxrandr -y

# mullvad
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/rpm/mullvad-keyring.asc
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
sudo wget -O /etc/yum.repos.d/mullvad.repo https://repository.mullvad.net/rpm/stable/mullvad.repo
sudo dnf install mullvad-vpn -y

# vs code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install code -y

# jetbrains ides
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community -y
flatpak install flathub com.jetbrains.WebStorm -y

# some other flatpaks
flatpak install flathub com.parsecgaming.parsec -y
flatpak install flathub io.exodus.Exodus -y
flatpak install flathub com.termius.Termius -y

# OBS and Wine
sudo dnf install obs-studio -y
sudo dnf install wine winetricks -y

# gaming and utilities
sudo dnf install bottles -y
sudo dnf install lutris -y
sudo dnf install htop -y
sudo dnf install fastfetch -y

# virtualbox stuff
sudo dnf install -y gcc make perl kernel-devel kernel-headers dkms elfutils-libelf-devel qt5-qtx11extras

# enable RPM Fusion (self explaintory)
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# actual vbox package
sudo dnf install -y VirtualBox

# build kernel modules for vbox
sudo akmods
sudo systemctl restart vboxdrv

# add my user to vbox users
sudo usermod -aG vboxusers $USER

echo "setup complete"

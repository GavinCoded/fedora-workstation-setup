#!/bin/bash
# stop if anything fails
set -e

# basic packages
echo "installing core stuff..."
sudo dnf update -y
sudo dnf install -y nodejs npm discord flatpak telegram-desktop steam lxrandr obs-studio wine winetricks bottles lutris htop fastfetch

# flatpak stuff
echo "setting up flatpak..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# flatpak applications 
flatpak install -y flathub com.spotify.Client com.bitwarden.desktop com.jetbrains.IntelliJ-IDEA-Community com.jetbrains.WebStorm com.parsecgaming.parsec io.exodus.Exodus com.termius.Termius org.videolan.VLC

# mullvad vpn
echo "installing mullvad..."
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/rpm/mullvad-keyring.asc
sudo wget -O /etc/yum.repos.d/mullvad.repo https://repository.mullvad.net/rpm/stable/mullvad.repo
sudo dnf install -y mullvad-vpn

# vscode (shit)
echo "installing vscode..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo tee /etc/yum.repos.d/vscode.repo >/dev/null <<< '[code]
name=visual studio code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc'
sudo dnf install -y code

# rpm fusion (needed for vbox and others)
echo "adding rpm fusion..."
sudo dnf install -y "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# virtualbox + deps
echo "installing virtualbox and deps..."
sudo dnf install -y gcc make perl kernel-devel kernel-headers dkms elfutils-libelf-devel qt5-qtx11extras virtualbox
sudo akmods
sudo systemctl restart vboxdrv
sudo usermod -aG vboxusers "$USER"

echo
echo "all done. reboot or relog to finish setup."

#!/bin/bash
set -e

install_dnf() {
    echo "installing $1..."
    sudo dnf install -y "$1"
}

install_flatpak() {
    echo "installing $1..."
    flatpak install -y flathub "$1"
}

echo "updating system..."
sudo dnf update -y

echo "installing basic packages..."
for pkg in nodejs npm discord flatpak telegram-desktop steam lxrandr obs-studio wine winetricks bottles lutris htop fastfetch; do
    install_dnf "$pkg"
done

echo "setting up flatpak..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "installing flatpak apps..."
apps=(
    "com.spotify.Client"
    "com.bitwarden.desktop" 
    "com.jetbrains.IntelliJ-IDEA-Community"
    "com.jetbrains.WebStorm"
    "com.parsecgaming.parsec"
    "io.exodus.Exodus"
    "com.termius.Termius"
    "org.videolan.VLC"
)
for app in "${apps[@]}"; do
    install_flatpak "$app"
done

echo "installing mullvad..."
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/rpm/mullvad-keyring.asc
sudo wget -O /etc/yum.repos.d/mullvad.repo https://repository.mullvad.net/rpm/stable/mullvad.repo
install_dnf mullvad-vpn

# SHIT CODE!
echo "installing vscode..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo tee /etc/yum.repos.d/vscode.repo >/dev/null <<< '[code]
name=visual studio code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc'
install_dnf code

echo "adding rpm fusion..."
sudo dnf install -y "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

echo "installing virtualbox..."
for pkg in gcc make perl kernel-devel kernel-headers dkms elfutils-libelf-devel qt5-qtx11extras virtualbox; do
    install_dnf "$pkg"
done
sudo akmods
sudo systemctl restart vboxdrv
sudo usermod -aG vboxusers "$USER"

echo "adding prismlauncher..."
sudo dnf copr enable g3tchoo/prismlauncher
install_dnf prismlauncher

echo "script complete! reboot the system"

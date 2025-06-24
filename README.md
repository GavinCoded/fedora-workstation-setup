# fedora setup

quick setup script for my fedora workstation (https://fedoraproject.org/workstation/)

## what it does

installs all the stuff i need on a fresh fedora install:
- development tools (node, vscode, intellij, webstorm)
- communication apps (discord, telegram, termius)
- entertainment (spotify, steam, parsec)
- utilities (bitwarden, mullvad vpn, htop, fastfetch, lxrandr, obs)
- gaming tools (bottles, lutris, wine, winetricks)
- crypto (exodus wallet)
- and more! too lazy to list look at the src if you care

## how to use

```bash
chmod +x setup.sh
./setup.sh
```

might take a while depending on your internet connection.

## notes

- makes sure flatpak is set up with flathub
- uses native packages where possible
- falls back to flatpak when needed
- should work on fedora 37+

reboot after running to make sure everything loads properly.

# why i made this
my arch linux install died after 2 months, and after trying fedora again on my main system, it's just too good for me to switch back to arch or any other distro. so i’m planning to main fedora long-term, and i made this script in case i ever need to reinstall (nvidia moment?) or set it up on another machine.

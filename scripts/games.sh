sudo dnf update
sudo dnf upgrade --refresh
flatpak update

flatpak install flathub net.davidotek.pupgui2

sudo dnf install lutris steam-devices

sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y curl gamemode icoutils libcurl wget zenity bubblewrap zstd cabextract tar goverlay openssl steam

wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sh PortProton_1.0 -rus

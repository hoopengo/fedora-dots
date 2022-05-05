# check for all updates
sudo dnf update
sudo yum update
sudo dnf upgrade --refresh -y
sudo dnf makecache --refresh

# install my most pkgs
sudo dnf -y install fish z git curl gcc clang cmake python3 python3-pip thunderbird wget gnome-tweaks dnf-plugins-core blueman neofetch util-linux-user

neofetch

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# add fish shell
sudo chsh -s /usr/bin/fish $USER
mkdir ~/.config/fish
sudo cp .config/config.fish ~/.config/fish/config.fish

fish

# add flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

# Настройка fish шелла под ваш вкус
fish_config

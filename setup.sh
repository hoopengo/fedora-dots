# check for all updates
sudo dnf update
sudo yum update
sudo dnf upgrade --refresh -y
sudo dnf makecache --refresh

# add flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

# install my most pkgs
sudo dnf -y install neovim htop fish z git curl gcc clang cmake python3 python3-pip fonts-powerline thunderbird wget gnome-tweaks dnf-plugins-core docker-ce docker-ce-cli containerd.io docker-compose-plugin blueman neofetch util-linux-user lm_sensors

# detect sensors
sudo sensors-detect

# add to start
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl start lm-sensors
sudo systemctl enable lm-sensors

neofetch

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# add fish shell
sudo chsh -s /usr/bin/fish $USER
mkdir ~/.config/fish
sudo cp .config/config.fish ~/.config/fish/config.fish

fish

# Настройка fish шелла под ваш вкус
fish_config

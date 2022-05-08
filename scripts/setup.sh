# check for all updates
sudo dnf update
sudo dnf upgrade --refresh
sudo dnf makecache --refresh

# add flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

# install flatseal
flatpak install flathub com.github.tchx84.Flatseal

# add non-free soft
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# install my most pkgs
sudo dnf -y install neovim \
                    htop \
                    fish \
                    z \
                    git \
                    curl \
                    gcc \
                    clang \
                    cmake \
                    python3 \
                    python3-pip \
                    thunderbird \
                    wget \
                    gnome-tweaks \
                    dnf-plugins-core \
                    blueman \
                    neofetch \
                    util-linux-user \
                    lm_sensors \
                    inxi \
                    ffmpeg

sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

# install docker
sudo dnf install -y docker-ce \
                    docker-ce-cli \
                    containerd.io \
                    docker-compose-plugin

# detect sensors
sudo sensors-detect

# add to start docker & lm-sensors
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl start lm-sensors
sudo systemctl enable lm-sensors

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

neofetch

# add fish shell
sudo chsh -s /usr/bin/fish $USER

# add fish config (.config/config.fish you can edit him)
mkdir ~/.config/fish
sudo cp .config/config.fish ~/.config/fish/config.fish

# start fish
fish

# setting up fish.
fish_config browse

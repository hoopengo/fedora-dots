#!/bin/sh
# SPDX-License-Identifier: MIT

#  ╱|、
# (` -7
# |、⁻〵  ) You're cool, i like it!
# じしˍ,)ノ

set -e

# Set the directory variable to the current working directory
DIR=$(pwd)

# Change to the user's home directory
cd ~

# Check that the user is not root
if [ $USER == "root" ]; then
    echo "User must not be root!"
    exit
fi

# Set DNF configuration options
echo "Setting DNF configuration options..."

chmod 777 /etc/dnf/dnf.conf
echo "[main]
gpgcheck=True
fastestmirror=True
skip_if_unavailable=True
clean_requirements_on_remove=True
installonly_limit=10
max_parallel_downloads=10
defaultyes=True" >/etc/dnf/dnf.conf # set DNF configuration options

# Install RPM Fusion repositories and update the system
echo "Installing RPM Fusion repositories and updating the system..."
sudo dnf install \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update -y
sudo dnf upgrade --refresh
sudo dnf makecache --refresh

# Install packages using DNF
echo "Installing packages using DNF..."
sudo dnf -y install \
    neovim \
    btop \
    fish \
    clang \
    cmake \
    python3 \
    python3-pip \
    gnome-tweaks \
    dnf-plugins-core \
    gnome-themes-extra \
    blueman \
    neofetch \
    util-linux-user \
    inxi \
    ffmpeg \
    wl-clipboard

# Clean up the system
echo "Cleaning up the system..."
sudo dnf autoremove
sudo dnf clean all

# Add Flathub repository and update packages
echo "Adding Flathub repository and updating packages..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

# Install Flatpak packages
echo "Installing Flatpak packages..."
flatpak install -y \
    com.mattjakeman.ExtensionManager \
    io.mpv.Mpv

# Change the user's shell to Fish and install Starship prompt
echo "Changing user's shell to Fish and installing Starship prompt..."
sudo chsh -s /usr/bin/fish $USER             # change user's shell to Fish
curl -sS https://starship.rs/install.sh | sh # install Starship prompt

# Configure GNOME settings
echo "Configuring GNOME settings..."
gsettings set org.gnome.desktop.sound event-sounds false                                           # disable event sounds
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true                          # allow volume above 100%
gsettings set org.gnome.desktop.wm.keybindings switch-input-source \[\'\<Alt\>Shift_L\'\]          # set input source switch keybinding
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward \[\'\<Shift\>Alt_L\'\] # set input source switch keybinding backwards
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 2                           # set volume step to 2

# Clone dotfiles repository and copy configuration files
echo "Cloning dotfiles repository and copying configuration files..."
git clone https://github.com/hoopengo/fedora-dots & # clone the repository in the background
cd fedora-dots
rsync -avxHAXP --exclude '.git*' .* ~/ # copy dotfiles to the user's home directory
rm -rf fedora-dots                     # remove the cloned repository

# configure gnome-terminal
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.2.0/install.py | python3 -

cd "$DIR"

echo "Script completed successfully."

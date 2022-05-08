flatpak update
flatpak install -y com.mattjakeman.ExtensionManager com.github.unrud.VideoDownloader com.obsproject.Studio de.haeckerfelix.Fragments dev.geopjr.Collision fr.handbrake.ghb fr.romainvigier.MetadataCleaner io.github.arunsivaramanneo.GPUViewer io.mpv.Mpv org.gnome.DejaDup org.kde.kdenlive org.kde.krita org.onlyoffice.desktopeditors flathub com.github.PintaProject.Pinta

sudo ln -s /var/lib/snapd/snap /snap
sudo snap refresh
sudo snap install --classic code
sudo snap install --classic pycharm-community
sudo snap install telegram-desktop
sudo snap install chromium
sudo snap install discord-canary
echo "Весь софт установлен!"

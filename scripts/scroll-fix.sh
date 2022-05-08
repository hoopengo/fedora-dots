sudo dnf update

sudo dnf install imwheel

cp .config/.imwheelrc ~/.imwheelrc
cp .config/imwheel.desktop ~/.config/autostart

imwheel --kill

sudo zypper install -t pattern devel_basis
sudo zypper install -y awesome brightnessctl alacritty neovim picom maim xclip qimgv fish opi mpv yt-dlp pulseaudio-utils pipewire pipewire-pulseaudio pavucontrol htop go discord spotifyd

systemctl --user enable pipewire
systemctl --user enable pipewire-pulse

echo "" >> ~/.bashrc
echo "[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx" >> ~/.bashrc
echo "exec fish" >> ~/.bashrc

echo "xset -b" > ~/.xinitrc
echo "exec awesome" >> ~/.xinitrc

sudo systemctl set-default multi-user.target

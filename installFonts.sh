echo "Please run this script as root!"

# Install Fonts
pacman -S ttf-liberation noto-fonts noto-fonts-emoji hack-font-ligature-nerd-font-git

# Copy Fonts
cp /home/json/linuxConfig/install/resources/75-noto-color-emoji.conf /etc/fonts/conf.avail/

# Enable Fonts
ln -sf /etc/fonts/conf.avail/75-noto-color-emoji.conf /etc/fonts/conf.d/


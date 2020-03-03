sudo pacman -S zsh

# Install oh-my-zsh
curl -L http://install.ohmyz.sh | sh

# Configure ZSH & aliases
cd ~
ln -s linuxConfig/.zshrc .zshrc
ln -s linuxConfig/.aliasrc .aliasrc 

# Add ZSH Plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



if [ $SHELL != '/usr/zsh' ]; then
    sudo dnf install zsh
    chsh -s $(which zsh)
    echo "Logout to load new shell configuration and run the script again"
    exit
fi

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install powerline fonts
sudo dnf install powerline-fonts

# install fzf
sudo dnf install fzf

# install spaceship theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"


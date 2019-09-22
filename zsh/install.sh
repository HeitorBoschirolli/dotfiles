if [ $SHELL != '/usr/zsh' ]; then
    sudo dnf install zsh
    chsh -s $(which zsh)
    echo "Logout to load new shell configuration and run the script again"
    exit
fi

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# powerline fonts are not installed: install it
if [ ! hash powerline-fonts 2>/dev/null ]; then
  sudo dnf install powerline-fonts
fi

# fzf is not installed: install it 
if [ ! hash fzf 2>/dev/null ]; then
  sudo dnf install fzf
fi

# install spaceship theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -f -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"


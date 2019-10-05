#!/bin/bash

# nvim 0.4 not installed: print error and exit script
if [[ $vim_version =~ "0.4" ]]; then
    echo "neovim 0.4 not installed. Install it and re-run install.sh"
    exit
fi

# install vim-plug for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create soft link in home dir
ln -s -f $(pwd)/init.vim ~/.config/nvim/init.vim

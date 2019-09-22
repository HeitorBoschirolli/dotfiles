# tmux not installed: install it
if ! hash tmux 2>/dev/null; then
  sudo dnf install tmux
fi

# powerline fonts not installed: install it
if ! hash powerline-fonts 2>/dev/null; then
  sudo dnf install powerline-fonts
fi

# create soft link in home dir
ln -s -f $(pwd)/.tmux.conf ~/.tmux.conf
cp .tmux.conf.local ~/


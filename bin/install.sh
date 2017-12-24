#!/bin/sh
set -u
set -e

set -x
mkdir -p $HOME/.vim/undodir/
mkdir -p $HOME/.vim/autoload/
curl -o $HOME/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -o $HOME/.vim/vimrc https://raw.githubusercontent.com/bertobc/vim-complex-sensible/master/vimrc
curl -o $HOME/.gitconfig https://raw.githubusercontent.com/bertobc/vim-complex-sensible/master/.gitconfig
curl -o $HOME/.tmux.conf https://raw.githubusercontent.com/bertobc/vim-complex-sensible/master/.tmux.conf.linux
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
if [ -d "${HOME}/.vim/" ] || [ -f "${HOME}/.vimrc" ] ; then
  echo "There is already a vim configuration in place! PlugUpdate:"
  vim +"PlugUpdate 1" +qall
else
  echo "New installation! PlugInstall:"
  vim +"PlugInstall 1" +qall
fi

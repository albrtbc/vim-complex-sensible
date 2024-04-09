#!/bin/sh
set -u
set -e
set -x

sudo apt-get update
sudo apt-get install -y vim-gtk3 git tmux unzip kitty

wget https://github.com/andresgongora/synth-shell/raw/master/setup.sh
chmod +x setup.sh
./setup.sh

mkdir -p $HOME/.vim/undodir/
mkdir -p $HOME/.vim/autoload/
mkdir -p $HOME/.git-scripts/
mkdir -p $HOME/.conf/kitty/
curl -o $HOME/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -o $HOME/.vim/vimrc https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/vimrc
curl -o $HOME/.gitconfig https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/.gitconfig
curl -o $HOME/.bashrc https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/.bashrc
curl -o $HOME/.tmux.conf https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/.tmux.conf
curl -o $HOME/.conf/kitty/kitty.conf https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/kitty.conf
curl -o $HOME/.git-scripts/git-rollback https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/.git-scripts/git-rollback
curl -o $HOME/.git-scripts/git-switch https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/.git-scripts/git-switch
curl -o $HOME/.git-scripts/git-push https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/.git-scripts/git-push
curl -o $HOME/.git-scripts/git-reset https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/.git-scripts/git-reset
curl -o $HOME/.git-scripts/git-branch-delete https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/.git-scripts/git-branch-delete
curl -o $HOME/.conf/synth-shell/synth-shell-prompt.sh https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/synth-shell/synth-shell-prompt.sh
curl -o $HOME/.conf/synth-shell/synth-shell-prompt.config https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/synth-shell/synth-shell-prompt.config
sudo chmod -R +x /home/albert/.git-scripts/
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
if [ -d "${HOME}/.vim/" ] || [ -f "${HOME}/.vimrc" ] ; then
  echo "There is already a vim configuration in place! PlugUpdate:"
  vim +"PlugUpdate" +qall
else
  echo "New installation! PlugInstall:"
  vim +"PlugInstall" +qall
fi

if [ -d "/run/WSL" ] ; then
    # append to vimrc
    echo "Append vimrc.windows functions into vimrc"
    curl -o $HOME/.vim/vimrc.windows https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/vimrc.windows
    cat $HOME/.vim/vimrc.windows >> $HOME/.vim/vimrc
    rm $HOME/.vim/vimrc.windows
fi

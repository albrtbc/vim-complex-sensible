#!/bin/sh
set -u
set -e
set -x

add-apt-repository ppa:neovim-ppa/stable
apt update

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -o $HOME/.config/nvim/init.vim https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/init.vim
curl -o $HOME/.gitconfig https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/.gitconfig
curl -o $HOME/.bashrc https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/.bashrc
curl -o $HOME/.tmux.conf https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/.tmux.conf.linux

#ln -sf $HOME/.vim/vimrc $HOME/.vimrc
nvim +"PlugInstall" +qall

if [ -d "/run/WSL" ];
then
    # append to vimrc
    echo "Append vimrc.windows functions into vimrc"
    curl -o $HOME/.config/nvim/init.vim.windows https://raw.githubusercontent.com/albrtbc/vim-complex-sensible/master/vimrc.windows
    cat $HOME/.config/nvim/init.vim.windows >> $HOME/.config/nvim/init.vim
    rm $HOME/.config/nvim/init.vim.windows

    # clip shared for windows
    echo "Installing win32yank - clip sharing between wsl and windows"
    curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
    unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
    chmod +x /tmp/win32yank.exe
    mv /tmp/win32yank.exe /usr/local/bin/
fi

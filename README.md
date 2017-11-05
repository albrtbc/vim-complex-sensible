# complex-sensible.vim

A vim configuration adapted to my workflow. The plugin can be automatically loaded with [Vim-Plug](https://github.com/junegunn/vim-plug), together with other plugins, as shown in the vimrc file. For instance, a way to quickly configure vim (including dictionaries for the spell checker) can be done copy/pasting the following commands (assuming you don't have ~/.vim nor ~/.vimrc):

```bash
cd $HOME
mkdir -p .vim/undodir/
mkdir -p .vim/spell/
mkdir -p .vim/autoload/
cd $HOME/.vim/autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd $HOME/
wget https://raw.githubusercontent.com/bertobc/vim-complex-sensible/master/vimrc -O .vim/vimrc
wget https://raw.githubusercontent.com/bertobc/vim-complex-sensible/master/.gitconfig
wget https://raw.githubusercontent.com/bertobc/vim-complex-sensible/master/.tmux.conf
ln -s .vim/vimrc .vimrc
cd $HOME/.vim/spell/
wget http://ftp.vim.org/vim/runtime/spell/en.utf-8.spl
wget http://ftp.vim.org/vim/runtime/spell/en.utf-8.sug
wget http://ftp.vim.org/vim/runtime/spell/es.utf-8.spl
wget http://ftp.vim.org/vim/runtime/spell/es.utf-8.sug
wget http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl
wget http://ftp.vim.org/vim/runtime/spell/fr.utf-8.sug
wget http://ftp.vim.org/vim/runtime/spell/ca.utf-8.spl
wget http://ftp.vim.org/vim/runtime/spell/ca.utf-8.sug
cd $HOME/
vim +PlugInstall +qall
```



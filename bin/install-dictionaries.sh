#!/bin/sh
set -u
set -e

if [ -d "${HOME}/.vim/spell/" ] ; then
  echo "There is already vim dictionaries in place! You can remove them first with:"
  echo "rm -rf ${HOME}/.vim/spell/" 
  exit 1
fi

set -x
mkdir -p $HOME/.vim/spell/
curl -o $HOME/.vim/spell/en.utf-8.spl http://ftp.vim.org/vim/runtime/spell/en.utf-8.spl
curl -o $HOME/.vim/spell/en.utf-8.sug http://ftp.vim.org/vim/runtime/spell/en.utf-8.sug
curl -o $HOME/.vim/spell/es.utf-8.spl http://ftp.vim.org/vim/runtime/spell/es.utf-8.spl
curl -o $HOME/.vim/spell/es.utf-8.sug http://ftp.vim.org/vim/runtime/spell/es.utf-8.sug

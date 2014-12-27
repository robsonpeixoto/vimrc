#!/usr/bin/env bash

if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [[ ! ~/.vimrc -ef ~/.vim/vimrc ]]; then
  mv -v ~/.vimrc{,.bak}
  ln -s ~/.vim/vimrc ~/.vimrc
fi

vim -c 'BundleUpdate' \
    -c 'BundleClean' \
    -c 'GoInstallBinaries' \
    -c 'GoUpdateBinaries' \
    -c 'qa'

echo "Installed!"

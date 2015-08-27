#!/bin/zsh

#
# update vimrc and zshrc
#

# update vim
cp ../.vimrc ~
vim +PluginInstall +qall
# update zsh
cp ../.zshrc ~
source ~/.zshrc

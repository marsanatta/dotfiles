#!/bin/zsh

#
# setup vim ,zsh and other plugins from scratch
#

# vim
sudo add-apt-repository ppa:fcwu-tw/ppa # for Vim 7.4
sudo apt-get update
sudo apt-get install vim
# Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# zsh  
sudo apt-get install zsh
# oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# autojump
git clone git://github.com/wting/autojump.git && cd autojump && ./install.py
# setup dotfiles
cp {../.vimrc,../.zshrc,../.gitignore} ~
cp -r {../.promptline_themes,../.zsh-git-prompt} ~
# [vim] install plugins
vim +PluginInstall +qall
# [vim] copy snippets in repo:vim-snippets into plugin:vim-snipmate
git clone https://github.com/honza/vim-snippets.git ~/.vim/bundle/vim-snippets
cp -r ~/.vim/bundle/vim-snippets/snippets ~/.vim/bundle/vim-snipmate
# [zsh] reload
source ~/.zshrc

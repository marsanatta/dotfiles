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
# autojump
sudo apt-get install autojump
# oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
# zsh-syntax-highlighting
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
# setup dotfiles
cp {../.vimrc,../.zshrc,../.gitignore} ~
# [vim] install plugins
vim +PluginInstall +qall
# [vim] copy snippets in repo:vim-snippets into plugin:vim-snipmate
git clone https://github.com/honza/vim-snippets.git ~/.vim/bundle/vim-snippets
cp -r ~/.vim/bundle/vim-snippets/snippets ~/.vim/bundle/vim-snipmate
# [zsh] reload
source ~/.zshrc

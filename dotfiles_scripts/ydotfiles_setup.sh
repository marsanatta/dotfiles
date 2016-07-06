#!/bin/zsh

#
# setup vim ,zsh and other plugins from scratch for working
#

# vim
sudo yum install vim # for updating Vim to 7.4
# Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# zsh  
sudo yum install zsh
# autojump for RHEL 6 64bit
wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpma 
sudo rpm -ivh epel-release-6-8.noarch.rpm
sudo yum install autojump-zsh
# oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
# zsh-syntax-highlighting
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
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

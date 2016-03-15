#!/bin/zsh

#
# setup vim ,zsh and other plugins from scratch for working
#

echo "hostname:"
read hostname
echo $hostname
## oh my zsh
echo "scping oh-my-zsh"
scp -r ~/.oh-my-zsh $hostname:~
echo "scping promptline_themes, zsh-git-prompt"
scp -r {~/.promptline_themes,~/.zsh-git-prompt} $hostname:~
## vim
echo "scping .vim"
scp -r ~/.vim $hostname:~
echo "scping .vimrc, .zshrc"
scp {~/.vimrc,~/.zshrc} $hostname:~

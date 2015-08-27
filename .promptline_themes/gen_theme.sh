#!/bin/zsh

#
# generates theme scripts and reloads zsh 
#

cp -i goldenline.vim ~/.vim/bundle/promptline.vim/autoload/promptline/themes/
vim -n '+PromptlineSnapshot ~/.promptline_goldenline.sh goldenline' +qall
source ~/.zshrc

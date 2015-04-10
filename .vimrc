set nocompatible				" use vim right? 
filetype on                  	" Enable filetype detection
filetype indent on				" Enable filetype-specific indenting
filetype plugin on				" Enable filetype-specific plugins

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'Lokaltog/vim-powerline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline' 
Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Plugin 'honza/vim-snippets'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" All of your Plugins must be added before the following line
call vundle#end()            " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" settings
" yank to clipboard
set clipboard=unnamed
" fix backspace
set backspace=indent,eol,start


" indent
set autoindent "always auto indent
set tabstop=4 softtabstop=4 shiftwidth=4 "tab length
set expandtab
au FileType javascript setl sw=2 sts=2 tabstop=2 et
au FileType ruby setl tabstop=2 shiftwidth=2 softtabstop=2 et
au FileType eruby setl tabstop=2 shiftwidth=2 softtabstop=2 et
au FileType html setl tabstop=2 shiftwidth=2 softtabstop=2 et
au FileType css setl tabstop=2 shiftwidth=2 softtabstop=2 et

" powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" airline
let airline_detect_whitespace=0

" mapleader
let mapleader=","

" hotkeys
:map	<F2>	:NERDTreeTabsToggle<CR>
	" view NERDTree from current open file
:map 	<F3> 	:NERDTreeFind<CR> 
    " toggle indent guides
:map    <F5>    :IndentGuidesToggle<CR>
    " syntastic check
:map    <F9>    :SyntasticCheck<CR>


:map 	<C-h>	:tabp<CR>
:map	<C-l>	:tabn<CR>
:map	<C-n>	:tabnew<CR>

" indent in Normal and Visual (using tab and shift-tab)
:nmap	<tab>	v>
:nmap	<s-tab>	v<
:vmap	<tab>	v>
:vmap	<s-tab>	v<

" Nerdtree
let NERDTreeShowHidden=0
let NERDTreeShowBookmarks=1

" Appearance
" set number " show line numbers
set relativenumber " show relative line number
syntax on
set t_Co=256
colorscheme mopkai

" indent-guide
let g:indent_guides_enable_on_vim_startup = 1 
let g:indent_guides_auto_colors = 0 
let g:indent_guides_guide_size = 1 
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=darkgrey ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=243

" ctrlP
let g:ctrlp_cmd = 'CtrlPMRU' " default mru

" ruby
	" syntax check
" autocmd FileType ruby map <F9> :w !ruby -c<CR>
	" execute 
autocmd FileType ruby map <F10> :!ruby %<CR>
    " omni complete in ruby
" set omnifunc=syntaxcomplete#Complete
" let g:rubycomplete_buffer_loading =1
" let g:rubycomplete_classes_in_global = 1
" let g:rubycomplete_rails = 1

" rails
    " this is used for demo
let g:rails_projections = {
\ "public/test/*.js":{"command":"js"}
\}

" snipmate
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
    " ruby file corresponds to ruby.snippets and rails.snippets
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'

" syntastic
" let g:syntastic_ruby_checkers = ['rubylint']


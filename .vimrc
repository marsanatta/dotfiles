"==================== Vundle ==================== 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim' " Vundle is a must
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes' 
Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim' 
Plugin 'kien/ctrlp.vim'
"Plugin 'vim-ruby/vim-ruby'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/syntastic'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular' 
"Plugin 'tpope/vim-rails'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'pangloss/vim-javascript'
"Plugin 'honza/vim-snippets'
"Plugin 'jiangmiao/auto-pairs'
" Plugin 'kana/vim-smartinput'
Plugin 'Raimondi/delimitMate'
"Plugin 'StanAngeloff/php.vim'
"Plugin 'othree/html5.vim'

call vundle#end()            " required

"==================== Options ==================== 
" use vim right? 
set nocompatible				
" Enable filetype detection
filetype on                  	
" Enable filetype-specific indenting
filetype indent on				
" Enable filetype-specific plugins
filetype plugin on				
" yank to clipboard
if $TMUX== ''
    set clipboard=unnamed
endif
" highlight serach terms
set hlsearch
" show search matches as you type
set incsearch

""==================== Appearance ==================== 

set nu " show the line number 
syntax on
set t_Co=256
set background=dark
if has("gui_running")
   colorscheme gruvbox
   set guifont=Droid\ Sans\ Mono\ for\ Powerline:h18
else
   colorscheme molokai
   "colorscheme mango
   "colorscheme gruvbox

endif

if exists('+colorcolumn')
  set colorcolumn=100
else
   au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif
"==================== Fixing ==================== 

" fix backspace
set backspace=indent,eol,start
" fix shift O delay
set timeout timeoutlen=315 ttimeoutlen=180
" fix '<,'>
vmap : :<C-u>
" display big5
set fileencodings=utf8,big5,gbk,latin1
set fileencoding=utf8

"==================== Indent ==================== 
set autoindent "always auto indent
set tabstop=4 softtabstop=4 shiftwidth=4 "tab length
set expandtab
"set copyindent
au FileType javascript setl sw=2 sts=2 tabstop=2 et
au FileType ruby setl tabstop=2 shiftwidth=2 softtabstop=2 et
au FileType eruby setl tabstop=2 shiftwidth=2 softtabstop=2 et
au FileType css setl tabstop=2 shiftwidth=2 softtabstop=2 et
au FileType yaml setl tabstop=2 shiftwidth=2 softtabstop=2 et

"==================== Airline ==================== 
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set term=xterm-256color
set termencoding=utf-8
let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1 
let g:airline_section_c='%F' "show file full path
let g:airline#extensions#tmuxline#enabled=0 "disable tmuxline to let the tmuxline use its own theme
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t' "only show the filaname
let g:airline#extensions#whitespace#enabled=0 "disable whitespace trailing detection
"==================== Promptline ==================== 
let g:promptline_preset = {
       \'a' : [ promptline#slices#host({'only_if_ssh': 1})],
       \'b' : [ promptline#slices#user()],
       \'c' : [ promptline#slices#cwd({'dir_limit': 3})],
       \'warn' : [ promptline#slices#last_exit_code()],
       \'z' : [ promptline#slices#vcs_branch()]}

"==================== Tmuxline ==================== 
let g:tmuxline_theme = 'powerline'
let g:tmuxline_powerline_separators=1
let g:tmuxline_preset = {
           \'a'    : '#S',
           \'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
           \'win'  : ['#I', '#W'],
           \'cwin' : ['#I', '#W', '#F'],
           \'x'    : '#(date)',
           \'z'    : '#H'}

"==================== Key Bindings ==================== 
" mapleader
let mapleader=","

" NERDTree Toggle
:map	<F2>	:NERDTreeTabsToggle<CR>
" view NERDTree from current open file
:map 	<F3> 	:NERDTreeFind<CR> 
" auto indent and jump back to current line
:map    <F4>    gg=G<C-o><C-o>
" toggle indent guides
:map    <F5>    :IndentGuidesToggle<CR>:GitGutterToggle<CR>
" toggle number
:map    <F6>    :set nu!<CR>
" syntastic check
:map    <F9>    :SyntasticCheck<CR>

" tabs
nmap 	<leader>h	:tabp<CR>
nmap	<leader>l	:tabn<CR>
nmap    <leader>tx   :tabclose<CR>

" buffers
set hidden
nmap <C-l> :bnext<CR>
nmap <C-h> :bprev<CR>
" Close the current buffer and move to the previous one
nmap <C-x> :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" indent in Normal and Visual (using tab and shift-tab)
:nmap	<tab>	v>
:nmap	<s-tab>	v<
:vmap	<tab>	v>
:vmap	<s-tab>	v<

" PageUp and PageDown for mac
:map <C-j> <PageDown>
:map <C-k> <PageUp>

"==================== NERDTree ====================
let NERDTreeShowBookmarks=1


"==================== Indent-Guide ====================
let g:indent_guides_enable_on_vim_startup = 1 
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
if !has("gui_running") " since Indent Guide automatically choose colors for gVim/MacVim
   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=darkgrey ctermbg=235
   autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=238
endif

"==================== CtrlP ==================== 
let g:ctrlp_cmd = 'CtrlPMRU' " default mru
let g:ctrlp_by_filename=1  " default to filename mode

"==================== Ruby  ==================== 
" syntax check
" autocmd FileType ruby map <F9> :w !ruby -c<CR>
" execute 
autocmd FileType ruby map <F10> :!ruby %<CR>
" omni complete in ruby
" set omnifunc=syntaxcomplete#Complete
" let g:rubycomplete_buffer_loading =1
" let g:rubycomplete_classes_in_global = 1
" let g:rubycomplete_rails = 1

"==================== Rails ==================== 
" this is used for demo
let g:rails_projections = {
           \ "public/test/*.js":{"command":"js"}
           \}

"==================== Cuda ==================== 
" syntax highlight for cuda
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda

"==================== C++ ==================== 
" syntastic(syntax check plugin) support for C++11
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

"==================== Snipmate ==================== 
" ruby file corresponds to ruby.snippets and rails.snippets
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'
let g:snipMate.scope_aliases['cuda'] = 'cuda,cpp'
let g:snipMate.scope_aliases['inc'] = 'php'

"==================== Syntastic ==================== 
" let g:syntastic_ruby_checkers = ['rubylint']
 let g:syntastic_php_checkers = ['phplint']
 let g:syntastic_mode_map = {
     \ "mode": "active",
     \ "passive_filetypes": ["java"] }

"==================== Tabular ==================== 
nmap <Leader>ae :Tabularize /=<CR>
vmap <Leader>ae :Tabularize /=<CR>
nmap <Leader>ac :Tabularize /:\zs<CR> 
vmap <Leader>ac :Tabularize /:\zs<CR>
nmap <Leader>aa :Tabularize /=><CR> 
vmap <Leader>aa :Tabularize /=><CR>

"==================== Auto-Paris ==================== 
let g:AutoPairsMapBS=0
let g:AutoPairsMultilineClose=0

"==================== GitGutter =====================
let g:gitgutter_realtime = 0 "trade accuracy for speed
let g:gitgutter_eager = 0 "trade accuracy for speed

if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

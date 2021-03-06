filetype plugin indent on
syntax on

" Default config {{{
set term=screen-256color
set t_Co=256
set ruler
set ts=4 sts=4 sw=4
set nocompatible
set autoindent
set number
set backspace=2
set ignorecase
set incsearch
set cursorline
set expandtab
set wildmenu
set hid
set lazyredraw
set autoread
set history=700
set ffs=unix,dos

set exrc

set encoding=utf8
set fileencoding=utf8

set backupdir=~/.vim/swp
set directory=~/.vim/swp

set shell=/bin/bash

set hidden

map ; :

set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set undofile
" }}}

" Shortcuts {{{

let mapleader = ','

map <F12> :TagbarToggle<CR>
map H :tabp<CR>
map L :tabn<CR>

map X :bn<CR>
map Z :bp<CR>

map <Leader>S :Ag! <cword><CR>

map <C-E> :NERDTreeToggle<CR>

map <Leader>g :Gstatus<CR>
map <Leader>c :Gcommit<CR>

map <Leader>ig :IndentGuidesToggle<CR>
map <C-p> :CtrlP<CR>

nmap <silent> <Leader>x :%XMLBeautify<CR>
vmap <silent> <Leader>x :XMLBeautify<CR>

" }}}

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'embear/vim-localvimrc'

" Polyglot
Plug 'sheerun/vim-polyglot'
Plug 'nelsyeung/twig.vim'

" Workspace
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'edkolev/promptline.vim'
Plug 'majutsushi/tagbar'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }

" GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax
Plug 'scrooloose/syntastic'
Plug 'patgrudniewski/vim-xml-beautifier'
Plug 'nathanaelkane/vim-indent-guides', { 'on': 'IndentGuidesToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'Shutnik/jshint2.vim'
Plug 'Townk/vim-autoclose'

call plug#end()

" Polyglot {{{
let g:polyglot_disabled = ['twig']

autocmd BufNewFile,BufRead *.gv setfiletype dot
" }}}

" Nerd {{{
let NERDTreeIgnore = ['\.o']
let NERDTreeShowHidden = 1
" }}}

" Close Tag {{{
let g:closetag_filenames = "*.html,*.xml,*.xhtml,*.phtml,*.js,*.twig"
" }}}

" Syntastic {{{
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["asm"]}
let g:syntastic_python_checkers = ['py3kwarn']
" }}}

" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_powerline_fonts = 1
set laststatus=2
" }}}

" Color scheme {{{
if !empty(globpath(&rtp, 'colors/solarized.vim'))
    let g:solarized_termcolors=256
    colorscheme solarized
    set background=dark
endif
" }}}

" JS {{{
let g:jsx_ext_required = 0
let jshint2_save = 1
let jshint2_close = 0
" }}}

" VIM Flod {{{
augroup vimrc
  au BufReadPre * setlocal foldmethod=marker
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
" }}}

" Remember line {{{
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
" Remember info about open buffers on close
set viminfo^=%
" }}}

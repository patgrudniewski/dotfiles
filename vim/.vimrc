filetype off

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
Plug 'majutsushi/tagbar'
Plug 'blueyed/vim-colors-solarized'
Plug 'embear/vim-localvimrc'
Plug 'nathanaelkane/vim-indent-guides', { 'on': 'IndentGuidesToggle' }
Plug 'scrooloose/syntastic'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'tpope/vim-surround'
Plug 'evidens/vim-twig'
Plug 'Townk/vim-autoclose'
Plug 'edkolev/promptline.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'tpope/vim-markdown'
Plug 'groenewege/vim-less'
Plug 'patgrudniewski/vim-xml-beautifier'
Plug 'sheerun/vim-polyglot'

" Nerd {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

let NERDTreeIgnore = ['\.o']
let NERDTreeShowHidden = 1

Plug 'scrooloose/nerdcommenter'
" }}}

" Close Tag {{{
Plug 'alvan/vim-closetag'
let g:closetag_filenames = "*.html,*.xml,*.xhtml,*.phtml"

" }}}

" Syntastic {{{

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["asm"]}
" }}}

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
set wildignore+=*/.gem/*,*/vendor/Plug/*,*/tmp/*,log/*,*/tmp/*,*/public/system*,*.orig,*.o

Plug 'wikitopian/hardmode'

" GIT {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()
filetype plugin indent on

" }}}

" Color scheme {{{
if !empty(globpath(&rtp, 'colors/solarized.vim'))
    let g:solarized_termcolors=256
    colorscheme solarized
    set background=dark
endif
" }}}

" JS {{{
Plug 'mxw/vim-jsx'

let g:jsx_ext_required = 0

Plug 'Shutnik/jshint2.vim'
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

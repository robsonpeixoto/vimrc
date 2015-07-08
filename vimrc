set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/usr/local/bin/bash

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'rking/ag.vim'
" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" tools
Plugin 'editorconfig/editorconfig-vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'sjl/gundo.vim'
" navegation
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jeetsukumaran/vim-buffergator'
" languages
Plugin 'fatih/vim-go'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'vim-scripts/groovy.vim'
Plugin 't9md/vim-chef'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
" python
Plugin 'davidhalter/jedi-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'klen/python-mode'
" markdown
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
" colorscheme
Plugin 'jpo/vim-railscasts-theme'

call vundle#end()            " required
filetype plugin indent on    " required


syntax on
set hlsearch
set incsearch		" do incremental searching
set background=dark

" gui configuration
if has('gui_running')
  set guifont=Menlo:h12
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif

" Using 2 spaces
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

let mapleader = ","

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_working_path_mode = ''

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <F5> :GundoToggle<CR>
nmap <F4> :TagbarToggle<CR>

" NERDTree
nmap <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\~$', '\.pyc$']

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

set laststatus=2
set statusline=%f%m%r%h%w\ 

" syntastic configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" disable java
let g:loaded_syntastic_java_javac_checker = 1
let g:loaded_syntastic_java_checkstyle_checker = 1
" disable scala
let g:loaded_syntastic_scala_fsc_checker = 1
let g:loaded_syntastic_scala_scalac_checker = 1
let g:loaded_syntastic_scala_scalastyle_checker = 1

colorscheme railscasts

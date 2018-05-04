source ~/.config/nvim/plug.vim

let mapleader = ","

if has('gui_running')
  set background=light
  silent! colorscheme solarized
else
  set background=dark
  silent! colorscheme solarized
endif
hi Normal guibg=NONE ctermbg=NONE
set colorcolumn=80
set cursorline
set number

set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set autoindent

set shell=/bin/bash

set splitbelow
set splitright

set mouse=a

set foldmethod=syntax
let vimsyn_folding='af'

source ~/.config/nvim/map.vim

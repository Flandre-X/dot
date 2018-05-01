source ~/.config/nvim/plug.vim

let mapleader = ","

if has('gui_running')
  set background=light
  colorscheme solarized
else
  set background=dark
  colorscheme solarized
endif
set colorcolumn=80
set cursorline
set number

set shell=/bin/bash

set splitbelow
set splitright

set mouse=a

source ~/.config/nvim/map.vim

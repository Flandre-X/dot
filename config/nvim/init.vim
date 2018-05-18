source ~/.config/nvim/plug.vim

let mapleader = ","

let g:TMUX = exists('$TMUX')

function! s:enable_termgui()
  if has('termguicolors')
    set termguicolors
  endif
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endfunction

call s:enable_termgui()
set background=dark
augroup colorscheme_custom
  autocmd!
  autocmd ColorScheme solarized hi Normal guibg=NONE ctermbg=NONE
augroup END
silent! colorscheme solarized
" Allow background to be transparent
if g:use_airline
  "let g:airline_theme = 'solarized'
endif

set colorcolumn=79
set cursorline
set number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent

set shell=/bin/bash

set splitbelow
set splitright

set mouse=a

set foldmethod=syntax
set nofoldenable
let g:vimsyn_folding='af'

set inccommand=nosplit

set undofile

source ~/.config/nvim/map.vim

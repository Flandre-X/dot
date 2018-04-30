call plug#begin('~/.config/nvim/plugged')

" Vim-specific
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

" Programming
" Requires manual installation
"Plug 'Valloric/YouCompleteMe'
Plug '~/.config/nvim/plugged/YouCompleteMe'

" Formatting
" TODO
Plug 'junegunn/vim-easy-align'

" Linting
"Plug 'neomake/neomake'
Plug 'w0rp/ale'

" Git
" TODO
Plug 'tpope/vim-fugitive'

" Python
"Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Color Schemes/Aesthetics
" TODO
"Plug 'vim-devicons'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'

call plug#end()

command! PU PlugUpdate | PlugUpgrade


if &runtimepath =~ 'ale'
  let g:ale_fixers = {
  \  'python': ['isort', 'yapf']
  \}
  "let g:ale_fix_on_save = 1

  nmap <silent> <C-k>  <Plug>(ale_previous_wrap)
  nmap <silent> <C-j>  <Plug>(ale_next_wrap)
endif


if &runtimepath =~ 'python-mode'
  echom "WORKS"
  let g:pymode_python = 'python3'
endif


if &runtimepath =~ 'YouCompleteMe'
  let g:ycm_autoclose_preview_window_after_completion=1

  let g:ycm_python_binary_path = '/usr/bin/python3'
  map <leader>g  :YcmCompleter GoToDefinitionElseDeclaratrion<CR>
endif

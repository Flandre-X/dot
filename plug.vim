" Everything preceded by SETUP may require manual installation

call plug#begin('~/.config/nvim/plugged')

" Required for certain plugins
Plug 'xolox/vim-misc'

" Vim-specific
" TODO read docs
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'kopischke/vim-stay'
Plug 'Konfekt/FastFold'


" Mappings/Commands/Text Objects
" TODO read docs
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
" TODO learn mappings
Plug 'scrooloose/nerdcommenter'
" TODO read docs
"Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-eunuch'


" TODO read docs
"Plug 'neomake/neomake'


" Code Writing assistance
" SETUP manual installation
"Plug 'Valloric/YouCompleteMe'
Plug '~/.config/nvim/plugged/YouCompleteMe'
Plug 'w0rp/ale'


" Navigation
" TODO learn mappings
Plug 'scrooloose/nerdtree'
" TODO read docs
"Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
" SETUP install 'exuberant-ctags'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'


" Git
" TODO read docs
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'


" Python
"Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'tmhedberg/SimpylFold'


" Aesthetics/Color Schemes
" SETUP install powerline/fonts
Plug 'powerline/fonts'
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'jnurmine/Zenburn'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
" TODO ryanoasis/nerd-fonts
"Plug 'ryanoasis/vim-devicons'

call plug#end()

command! PU PlugUpdate | PlugUpgrade


function! PlugEnabled(plug)
  return &runtimepath =~ 'plugged/' . a:plug . '/'
endfunction


if PlugEnabled('ale')
  let g:ale_fixers = {
  \  'python': ['isort', 'yapf']
  \}
  "let g:ale_fix_on_save = 1

  nmap <silent> <C-k>  <Plug>(ale_previous_wrap)
  nmap <silent> <C-j>  <Plug>(ale_next_wrap)
endif


if PlugEnabled('vim-devicons')
  "set guifont
endif


if PlugEnabled('vim-easy-align')
  xmap ga  <Plug>(EasyAlign)
  nmap ga  <Plug>(EasyAlign)
endif


if PlugEnabled('vim-fugitive')
  noremap <C-S-H>  <ESC>:Git 
  noremap <silent> <C-S-A>c  :Gcommit<CR>
  noremap <silent> <C-S-A>p  :echomsg 'Pushing...'<CR>:Gpush<CR>
  noremap <silent> <C-S-A>s  :Gstatus<CR>
endif


if PlugEnabled('lightline.vim')
  " Showing mode in the bottom line is now redundant
  set noshowmode

  " Automatically change lightline colorscheme whenever the colorscheme
  " changes
  autocmd ColorScheme * let g:lightline.colorscheme = g:colors_name

  let g:lightline = {
    \ 'component': {
    \   'lineinfo': ' %3l:%-2v',
    \ },
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'fugitive': 'LightlineFugitive'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }
  function! LightlineReadonly()
    return &readonly ? '' : ''
  endfunction
  function! LightlineFugitive()
    if exists('*fugitive#head')
      let branch = fugitive#head()
      return branch !=# '' ? ''.branch : ''
    endif
    return ''
  endfunction
endif


if PlugEnabled('nerdcommenter')
  " Add spaces after comment delimiters by default
  "let g:NERDSpaceDelims = 1
  " Use compact syntax for prettified multi-line comments
  "let g:NERDCompactSexyComs = 1
  " Align line-wise comment delimiters flush left instead of following code indentation
  "let g:NERDDefaultAlign = 'left'
  " Set a language to use its alternate delimiters by default
  "let g:NERDAltDelims_java = 1
  " Add your own custom formats or override the defaults
  "let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
  " Allow commenting and inverting empty lines (useful when commenting a region)
  "let g:NERDCommentEmptyLines = 1
  " Enable trimming of trailing whitespace when uncommenting
  "let g:NERDTrimTrailingWhitespace = 1
endif


if PlugEnabled('nerdtree')
  noremap <C-\>  :NERDTreeToggle<CR>
  noremap <A-\>  :NERDTreeFocus<CR>
endif


if PlugEnabled('python-mode')
  let g:pymode_python = 'python3'
endif


if PlugEnabled('SimpylFold')
  "let g:SimpylFold_docstring_preview = 1
endif


if PlugEnabled('tagbar')
  nnoremap <silent> <F8>  :TagbarToggle<CR>
endif


if PlugEnabled('YouCompleteMe')
  let g:ycm_autoclose_preview_window_after_completion=1

  let g:ycm_python_binary_path = '/usr/bin/python3'
  map <leader>g  :YcmCompleter GoToDefinitionElseDeclaratrion<CR>
endif

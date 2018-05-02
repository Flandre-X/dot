" Everything preceded by SETUP may require manual installation

" SETUP Go to https://github.com/junegunn/vim-plug and install
" E.g.
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.config/nvim/plugged')

" Required for certain plugins
Plug 'xolox/vim-misc'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Vim-specific
" TODO read docs
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'kopischke/vim-stay'
Plug 'Konfekt/FastFold'
Plug 'ap/vim-buftabline'
Plug 'sjl/gundo.vim'
Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-sleuth'


" Mappings/Commands/Text Objects
" TODO read docs
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
" TODO learn mappings
Plug 'scrooloose/nerdcommenter'
" TODO read docs
"Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-eunuch'
Plug 'terryma/vim-multiple-cursors'
" TODO learn mappings
Plug 'wellle/visual-split.vim'


" TODO read docs
"Plug 'neomake/neomake'


" Code Writing assistance
" SETUP May require manual installation
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'tpope/vim-endwise'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'


" Navigation
" TODO learn mappings
Plug 'scrooloose/nerdtree'
" TODO read docs
"Plug 'mileszs/ack.vim'
" Possible alternative?
"Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'
" SETUP Install 'exuberant-ctags'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'haya14busa/incsearch.vim'
Plug 'unblevable/quick-scope'
" TODO learn mappings
Plug 'tpope/vim-unimpaired'


" Git
" TODO read docs
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'


" Python
"Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'tmhedberg/SimpylFold'


" Aesthetic/Color Schemes
" SETUP Install 'powerline/fonts' (optional)
Plug 'itchyny/lightline.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ntpeters/vim-better-whitespace'
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'jnurmine/Zenburn'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
" SETUP Patch a font with ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons'

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


if PlugEnabled('auto-pairs')
  " Turn on Fly Mode
  let g:AutoPairsFlyMode = 1
endif


if PlugEnabled('vim-devicons')
  "set guifont
endif


if PlugEnabled('vim-easy-align')
  xmap ga  <Plug>(EasyAlign)
  nmap ga  <Plug>(EasyAlign)
endif


if PlugEnabled('vim-easytags')
  " Generate tags asynchronously
  let g:easytags_async = 1
endif


if PlugEnabled('vim-fugitive')
  noremap <silent> <C-a>c  :Gcommit<CR>
  noremap <silent> <C-a>p  :echomsg 'Pushing...'<CR>:Gpush<CR>
  noremap <silent> <C-a>s  :Gstatus<CR>
endif


if PlugEnabled('gundo.vim')
  nnoremap <silent> <F5>  :GundoToggle<CR>
endif


if PlugEnabled('incsearch.vim')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
endif


if PlugEnabled('lightline.vim')
  " Showing mode in the bottom line is now redundant
  set noshowmode

  " Automatically change lightline colorscheme whenever the colorscheme
  " changes
  let g:lightline = {}
  autocmd ColorScheme * let g:lightline.colorscheme = g:colors_name

  let s:fancy_lightline = 0

  if s:fancy_lightline
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
  noremap <silent> <C-\>  :NERDTreeToggle<CR>
  noremap <silent> <A-\>  :NERDTreeFocus<CR>
endif


if PlugEnabled('python-mode')
  let g:pymode_python = 'python3'
endif


if PlugEnabled('quick-scope')
  " Only highlight keys when pressing one of these
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
  nmap <leader>q  <Plug>(QuickScopeToggle)
  vmap <leader>q  <Plug>(QuickScopeToggle)
endif


if PlugEnabled('SimpylFold')
  "let g:SimpylFold_docstring_preview = 1
endif


if PlugEnabled('vim-snipmate')
  imap <C-j>  <Esc>a<Plug>snipMateNextOrTrigger
  smap <C-j>  <Plug>snipMateNextOrTrigger
endif


if PlugEnabled('tagbar')
  nnoremap <silent> <F8>  :TagbarToggle<CR>
endif


if PlugEnabled('YouCompleteMe')
  let g:ycm_autoclose_preview_window_after_completion=1

  let g:ycm_python_binary_path = '/usr/bin/python3'
  map <leader>g  :YcmCompleter GoToDefinitionElseDeclaratrion<CR>
endif

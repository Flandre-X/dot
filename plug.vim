" Everything preceded by SETUP may require manual installation

" SETUP Go to https://github.com/junegunn/vim-plug and install
" E.g.
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.config/nvim/plugged')

" Required for certain plugins
Plug 'xolox/vim-misc'                 " Miscellaneous auto-load Vim scripts
Plug 'MarcWeber/vim-addon-mw-utils'   " Interpret a file by function and cache
                                      " file automatically
Plug 'tomtom/tlib_vim'                " Some utility functions for VIM

" Vim-specific
" TODO read docs
Plug 'tpope/vim-sensible'     " Defaults everyone can agree on
Plug 'tpope/vim-repeat'       " Enable repeating supported plugin maps with '.'
Plug 'kopischke/vim-stay'     " Make Vim persist editing state without fuss
Plug 'Konfekt/FastFold'       " Speed up Vim fold updating
Plug 'ap/vim-buftabline'      " A buffer list that lives in the tabline
Plug 'sjl/gundo.vim'          " Visualize your Vim undo tree
Plug 'vimlab/split-term.vim'  " Utilities around neovim's `:terminal`
Plug 'tpope/vim-sleuth'   " Heuristically set tab options based on current file


" Mappings/Commands/Text Objects
" TODO read docs
Plug 'tpope/vim-surround'   " Mappings to delete, change, and add surroundings
Plug 'junegunn/vim-easy-align'    " Mappings for text alignment
" TODO learn mappings
Plug 'scrooloose/nerdcommenter'   " Comment mappings
" TODO read docs
"Plug 'svermeulen/vim-easyclip'   " Simplified clipboard functionality
Plug 'tpope/vim-eunuch'           " Vim sugar for UNIX shell commands
" TODO learn mappings
Plug 'terryma/vim-multiple-cursors' " Sublime Text-like multiple cursors
" TODO learn mappings
Plug 'wellle/visual-split.vim'    " Control splits with visual selections
" TODO learn mappings
Plug 'tpope/vim-unimpaired'       " Pairs of handy bracket mappings
" TODO learn mappings
Plug 'easymotion/vim-easymotion'  " Vim motions on speed!


" TODO read docs
"Plug 'neomake/neomake'   " Asynchronous linting and make framework


" Code Writing assistance
" SETUP May require manual installation
Plug 'Valloric/YouCompleteMe'   " Code-completion engine
Plug 'w0rp/ale'                 " Asynchronous Lint Engine
Plug 'tpope/vim-endwise'        " Wisely add 'end'-like keywords
Plug 'garbas/vim-snipmate'      " TextMate's snippets
Plug 'honza/vim-snippets'       " vim-snipmate default snippets
Plug 'jiangmiao/auto-pairs'     " Insert or delete pairs


" Navigation
" TODO learn mappings
Plug 'scrooloose/nerdtree'  " Tree explorer plugin
" TODO read docs
"Plug 'mileszs/ack.vim'     " Search tool with enhanced results list
" TODO Possible alternative?
"Plug 'dyng/ctrlsf.vim'     " Ack powered code search
Plug 'ctrlpvim/ctrlp.vim'   " Full path fuzzy file, buffer, mru, tag,... finder
" SETUP Install 'exuberant-ctags'
Plug 'xolox/vim-easytags'   " Automated tag file generation and syntax
                            " highlighting of tags
Plug 'majutsushi/tagbar'    " Display tags in a window, ordered by scope
Plug 'haya14busa/incsearch.vim'   " Improved incremental searching
Plug 'unblevable/quick-scope'   " Highlights which characters to target for f/F


" Git
" TODO read docs
Plug 'tpope/vim-fugitive'       " A Git wrapper so awesome, it should be illegal
Plug 'airblade/vim-gitgutter'   " Shows a git diff in the gutter and stages/
                                " undoes hunks
Plug 'Xuyuanp/nerdtree-git-plugin'    " NERDTree showing git status flags


" Python
" PyLint, Rope, Pydoc breakpoints from box
"Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'tmhedberg/SimpylFold'             " Python code folding
Plug 'Vimjas/vim-python-pep8-indent'    " Modifies indentation behavior to
                                        " comply with PEP8


" Aesthetic/Color Schemes
" SETUP Install 'powerline/fonts' (optional)
Plug 'itchyny/lightline.vim'    " Light and configurable statusline/tabline
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Syntax highlight for NERDTree
Plug 'ntpeters/vim-better-whitespace'   " Trailing whitespace highlighting
Plug 'flazz/vim-colorschemes'   " Collection of vim color schemes
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'jnurmine/Zenburn'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
" SETUP Patch a font with ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons'   " Add icons to NERDTree

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
  else
    let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
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

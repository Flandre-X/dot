" Everything preceded by XXX may require manual installation

" XXX Go to https://github.com/junegunn/vim-plug and install
" E.g.
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

scriptencoding utf-8

let g:use_lightline = v:false
let g:use_airline = v:true
let g:use_powerline = v:false
" Set to 0 to disable plugin features which use powerline symbols
let g:use_powerline_font = v:true

function! Cond(cond, ...)
  let l:opts = get(a:000, 0, {})
  return a:cond ? l:opts : extend(l:opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.config/nvim/plugged')

" Required for certain plugins
Plug 'xolox/vim-misc'                 " Miscellaneous auto-load Vim scripts
Plug 'MarcWeber/vim-addon-mw-utils'   " Interpret a file by function and cache
                                      " file automatically
Plug 'tomtom/tlib_vim'                " Some utility functions for VIM
Plug 'godlygeek/tabular'              " Text filtering and alignment
                                      " plasticboy/vim-markdown


" Vim-specific
" TODO read docs
Plug 'tpope/vim-sensible'     " Defaults everyone can agree on
Plug 'tpope/vim-repeat'       " Enable repeating supported plugin maps with '.'
Plug 'kopischke/vim-stay'     " Make Vim persist editing state without fuss
Plug 'Konfekt/FastFold'       " Speed up Vim fold updating
Plug 'sjl/gundo.vim'          " Visualize your Vim undo tree
Plug 'tpope/vim-sleuth'   " Heuristically set tab options based on current file
Plug 'qpkorr/vim-bufkill'     " Reasonable bufkill
"Plug 'bagrat/vim-workspace'   " IDE-like tabs to Vim
Plug 'sickill/vim-pasta'      " Pasting with indentation adjusted to context
" TODO fix errors
Plug 'vim-scripts/ZoomWin'    " Toggle zoom single window
Plug 'tpope/vim-dispatch'     " Asynchronicity (e.g. fugitive)
Plug 'mhinz/vim-randomtag'    " Lean something new about Vim every day


" Mappings/Commands/Text Objects
" TODO read docs
Plug 'tpope/vim-surround'   " Mappings to delete, change, and add surroundings
Plug 'AndrewRadev/splitjoin.vim'  " Switch between single- and multi-line
Plug 'junegunn/vim-easy-align'    " Mappings for text alignment
" TODO learn mappings
Plug 'scrooloose/nerdcommenter'   " Comment mappings
" TODO read docs
Plug 'svermeulen/vim-easyclip'    " Simplified clipboard functionality
Plug 'tpope/vim-eunuch'           " Vim sugar for UNIX shell commands
" TODO learn mappings
Plug 'terryma/vim-multiple-cursors' " Sublime Text-like multiple cursors
" TODO learn mappings
Plug 'wellle/visual-split.vim'    " Control splits with visual selections
" TODO learn mappings
Plug 'tpope/vim-unimpaired'       " Pairs of handy bracket mappings
Plug 'tpope/vim-rsi'              " Readline key bindings in Vim
" TODO install more text objects at kana/vim-textobj-user/wiki
Plug 'kana/vim-textobj-user'      " Create your own text objects without pain
Plug 'kana/vim-textobj-entire'    " Text objects for entire buffer
Plug 'guns/vim-sexp'              " TODO
" TODO lean mappings
Plug 'wellle/targets.vim'         " Add various text objects
Plug 'michaeljsmith/vim-indent-object' " Text objects based on indentation level
" TODO learn mappings
Plug 'easymotion/vim-easymotion'  " Vim motions on speed!
Plug 'jeetsukumaran/vim-indentwise' " Motions based on indent depths or levels
Plug 'tpope/vim-speeddating'      " <C-A>/<C-X> increments dates and more
Plug 'terryma/vim-expand-region'  " Visually select increasingly larger regions
Plug 'ervandew/supertab'          " Use tab for all your insert completion needs


" Code Writing assistance
" XXX May require manual installation
Plug 'Valloric/YouCompleteMe', { 'do:': './install.py --clang-completer' }
" TODO read docs
if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/echodoc.vim'         " Display function signatures in command ln
Plug 'w0rp/ale'                   " Asynchronous Lint Engine
Plug 'tpope/vim-endwise'          " Wisely add 'end'-like keywords
Plug 'garbas/vim-snipmate'        " TextMate's snippets
Plug 'honza/vim-snippets'         " vim-snipmate default snippets
Plug 'jiangmiao/auto-pairs'       " Insert or delete pairs
Plug 'KabbAmine/zeavim.vim'       " Zeal documentation from Vim
Plug 'tweekmonster/braceless.vim' " Text objects, folding, etc for Python and others


" Testing/Debugging/Terminal/tmux
Plug 'janko-m/vim-test'         " Run tests on different granularities
Plug 'vimlab/split-term.vim'  " Utilities around neovim's `:terminal`
Plug 'benmills/vimux'         " Interact with tmux from vim - e.g. code exec
" TODO may not be necessary
Plug 'krisajenkins/vim-pipe'  " Send a vim buffer through a command


" Navigation
" TODO learn mappings
Plug 'scrooloose/nerdtree'  " Tree explorer plugin
Plug 'jistr/vim-nerdtree-tabs'  " Open in all tabs
" TODO read docs
"Plug 'mileszs/ack.vim'      " Search tool with enhanced results list
" TODO Possible alternative?
"Plug 'dyng/ctrlsf.vim'      " Ack powered code search
Plug 'ctrlpvim/ctrlp.vim'   " Full path fuzzy file, buffer, mru, tag,... finder
" TODO read docs
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'     " Fuzzy finder
" XXX Install 'exuberant-ctags'
Plug 'xolox/vim-easytags'   " Automated tag file generation and syntax
                            " highlighting of tags
Plug 'majutsushi/tagbar'    " Display tags in a window, ordered by scope
Plug 'osyo-manga/vim-anzu'  " 現在の検索位置を画面に表示するためのプラグイン
Plug 'haya14busa/incsearch.vim'      " Improved incremental searching
Plug 'haya14busa/is.vim'    " Improved Improved incremental searching
Plug 'haya14busa/incsearch-fuzzy.vim'   " Fuzzy incremental searching
Plug 'haya14busa/vim-asterisk'  " Improved * motions
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
Plug 'tmhedberg/SimpylFold'     " Python code folding


" Misc Language/Syntax
Plug 'sheerun/vim-polyglot'           " Collection of language packs
Plug 'plasticboy/vim-markdown'
Plug 'jceb/vim-orgmode'               " Emacs' Org-Mode for Vim
Plug 'tmux-plugins/vim-tmux'          " Syntax highlighting for tmux
Plug 'euclio/vim-markdown-composer'   " Asynchronous markdown preview
Plug 'lepture/vim-jinja'              " Syntax highlighting for 神社


" Miscellaneous
Plug 'qpkorr/vim-renamer'     " Batch rename files


" Aesthetic/Color Schemes
" XXX Install nerd fonts at ryanoasis/nerd-fonts
" Light and configurable statusline/tabline
Plug 'itchyny/lightline.vim', Cond(g:use_lightline)
" A buffer list that lives in the tabline
Plug 'ap/vim-buftabline', Cond(g:use_lightline)
" Statusline for Vim
Plug 'vim-airline/vim-airline', Cond(g:use_airline)
" Themes for airline
Plug 'vim-airline/vim-airline-themes', Cond(g:use_airline)
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Syntax highlight for NERDTree
Plug 'ntpeters/vim-better-whitespace'   " Trailing whitespace highlighting
"Plug 'Yggdroot/indentLine'      " Display lines at each indentation level
Plug 'ap/vim-css-color'         " Preview colors in source code while editing
Plug 'junegunn/goyo.vim'        " Distraction-free writing in Vim
Plug 'junegunn/limelight.vim'   " Hyperfocus-writing in Vim
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'whatyouhide/vim-gotham'
" Load last
Plug 'ryanoasis/vim-devicons'   " Add icons to NERDTree


" TODO
" May be superceded by easyclip
"Plug 'maxbrunsfeld/vim-yankstack'   " Emacs 'kill ring' for Vim
"Plug 'vim-scripts/YankRing.vim'     " Emacs 'kill ring' for Vim
" FZF + ripgrep
" http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
" https://github.com/BurntSushi/ripgrep
"Plug 'thinca/vim-quickrun'

call plug#end()

command! PU  PlugUpdate | PlugUpgrade


function! PlugEnabled(plug)
  return &runtimepath =~# 'plugged/' . a:plug . '/'
endfunction

if PlugEnabled('vim-airline')
  if g:use_powerline_font
    let g:airline_powerline_fonts = 1
  endif

  if !PlugEnabled('vim-workspace')
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'default'
  endif
endif


if PlugEnabled('ale')
  let g:ale_fixers = {
  \  'python': ['isort', 'yapf'],
  \  'sh':     ['shellcheck'],
  \  'vim':    ['vint']
  \}
  "let g:ale_fix_on_save = 1

  nmap <silent> <C-k>  <Plug>(ale_previous_wrap)
  nmap <silent> <C-j>  <Plug>(ale_next_wrap)
endif


if PlugEnabled('auto-pairs')
  " Turn on Fly Mode
  let g:AutoPairsFlyMode = 1
endif


if PlugEnabled('braceless.vim')
  augroup braceless_custom
    au!
    autocmd FileType python BracelessEnable +indent
    " +highlight not used because it's very slow
  augroup END
endif


if PlugEnabled('deoplete.vim')
  " TODO lazy load
  let g:deoplete#enable_at_startup = 1
  let g:python_host_prog  = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
  augroup deoplete_custom
    au!
    autocmd CompleteDone * silent! pclose!
  augroup END
endif


if PlugEnabled('vim-devicons')
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
endif


if PlugEnabled('vim-easy-align')
  xmap ga  <Plug>(EasyAlign)
  nmap ga  <Plug>(EasyAlign)
endif


if PlugEnabled('vim-easyclip')
  let g:EasyClipUseSubstituteDefaults = 1

  nnoremap gm  m
endif


if PlugEnabled('vim-easytags')
  " Generate tags asynchronously
  let g:easytags_async = 1
endif


if PlugEnabled('vim-fugitive')
  "noremap <silent> <C-a>c  :Gcommit<CR>
  "noremap <silent> <C-a>p  :echomsg 'Pushing...'<CR>:Gpush<CR>
  "noremap <silent> <C-a>s  :Gstatus<CR>
endif


if PlugEnabled('vim-gitgutter')
  " Make gutter update faster
  set updatetime=100
  let g:gitgutter_override_sign_column_highlight = 0
  highlight clear SignColumn
endif


if PlugEnabled('goyo.vim')
  nmap <silent> <Leader>G  :Goyo<CR>
  if PlugEnabled('limelight.vim')
    augroup goyo_custom
      au!
      autocmd User GoyoEnter Limelight
      autocmd User GoyoLeave Limelight!
    augroup END
  endif
endif


if PlugEnabled('gundo.vim')
  nnoremap <silent> <F5>  :GundoToggle<CR>
endif


if PlugEnabled('incsearch.vim')
  map /   <Plug>(incsearch-forward)
  map ?   <Plug>(incsearch-backward)
  map g/  <Plug>(incsearch-stay)
endif


if PlugEnabled('incsearch-fuzzy.vim')
  map z/   <Plug>(incsearch-fuzzy-/)
  map z?   <Plug>(incsearch-fuzzy-?)
  map zg/  <Plug>(incsearch-fuzzy-stay)
endif


if PlugEnabled('is.vim')
  if PlugEnabled('vim-asterisk')
    map *   <Plug>(asterisk-z*)<Plug>(is-nohl-1)
    map g*  <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
    map #   <Plug>(asterisk-z#)<Plug>(is-nohl-1)
    map g#  <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
  endif
  if !PlugEnabled('vim-airline') && PlugEnabled('vim-anzu')
    map n  <Plug>(is-nohl-1)<Plug>(anzu-n-with-echo)
    map N  <Plug>(is-nohl-1)<Plug>(anzu-N-with-echo)
  endif
endif


if PlugEnabled('lightline.vim')
  " Showing mode in the bottom line is now redundant
  set noshowmode

  " Automatically change lightline colorscheme whenever the colorscheme
  " changes
  let g:lightline = {}
  augroup lightline_custom
    au!
    autocmd ColorScheme * let g:lightline.colorscheme = g:colors_name
  augroup END

  if g:use_powerline_font
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
        let l:branch = fugitive#head()
        return l:branch !=# '' ? ''.l:branch : ''
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


if PlugEnabled('limelight.vim')
  nmap <Leader>l  <Plug>(Limelight)
  xmap <Leader>l  <Plug>(Limelight)
endif


if PlugEnabled('vim-markdown')
  augroup vim_markdown
    au!
    au FileType markdown set conceallevel=2
  augroup END
endif


if PlugEnabled('vim-multiple-cursors')
  " Disable deoplete when using vim-multiple-cursors
  if PlugEnabled('deoplete.vim')
    function g:Multiple_cursors_before()
      call deoplete#custom#buffer_option('auto_complete', v:false)
    endfunction
    function g:Multiple_cursors_after()
      call deoplete#custom#buffer_option('auto_complete', v:true)
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


if PlugEnabled('vim-nerdtree-tabs')
  noremap <silent> <C-\>  :NERDTreeTabsToggle<CR>
  noremap <silent> <A-\>  :NERDTreeSteppedOpen<CR>
elseif PlugEnabled('nerdtree')
  noremap <silent> <C-\>  :NERDTreeToggle<CR>
  noremap <silent> <A-\>  :NERDTreeFocus<CR>
endif


if PlugEnabled('vim-pipe')
  let g:vimpipe_invoke_map = '<LocalLeader>r'
  let g:vimpipe_close_map = '<LocalLeader>p'
endif


if PlugEnabled('vim-polyglot')
  " Use different language plugins instead of default
  let g:polyglot_disabled = ['tmux', 'markdown']
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


if PlugEnabled('vim-workspace')
  if g:use_powerline_font
    let g:workspace_powerline_separators = 1
  endif

  noremap <Tab>            :WSNext<CR>
  noremap <S-Tab>          :WSPrev<CR>
  noremap <Leader><Tab>    :WSClose<CR>
  noremap <Leader><S-Tab>  :WSClose!<CR>
  noremap <C-t>            :WSTabNew<CR>
endif


if PlugEnabled('YouCompleteMe')
  let g:ycm_autoclose_preview_window_after_completion=1

  let g:ycm_python_binary_path = '/usr/bin/python3'
  map <leader>g  :YcmCompleter GoToDefinitionElseDeclaratrion<CR>
endif

if PlugEnabled('zeavim.vim')
  " <leader><leader> is the easymotion prefix
  nmap <leader>z  <Plug>Zeavim
  vmap <leader>z  <Plug>ZVVisSelection
  nmap <leader>Z  <Plug>ZVKeyDocset
endif

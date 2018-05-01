call plug#begin('~/.config/nvim/plugged')

" Vim-specific
" TODO read docs
Plug 'tpope/vim-sensible'
" TODO read docs
Plug 'tpope/vim-surround'
" TODO read docs
Plug 'Konfekt/FastFold'
Plug 'kopischke/vim-stay'

" Programming
" Requires manual installation
"Plug 'Valloric/YouCompleteMe'
Plug '~/.config/nvim/plugged/YouCompleteMe'

" TODO read docs
"Plug 'neomake/neomake'

" Code Formatting/Linting
Plug 'w0rp/ale'
" TODO read docs
Plug 'junegunn/vim-easy-align'

" Navigation
" TODO read docs
Plug 'scrooloose/nerdtree'

" Git
" TODO read docs
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Python
"Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'tmhedberg/SimpylFold'

" Color Schemes/Aesthetics
" TODO install powerline/fonts
Plug 'powerline/fonts'
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'jnurmine/Zenburn'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
" TODO
Plug 'ryanoasis/nerd-fonts'
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


if PlugEnabled('YouCompleteMe')
  let g:ycm_autoclose_preview_window_after_completion=1

  let g:ycm_python_binary_path = '/usr/bin/python3'
  map <leader>g  :YcmCompleter GoToDefinitionElseDeclaratrion<CR>
endif

" Esc to escape from terminal
tnoremap <Esc>  <C-\><C-V>

" Toggle fold/unfold
nnoremap <space>  za

" Temporarily turn of search highlighting
nnoremap <leader>/  :nohlsearch<CR>

" Paste from clipboard (Inserting ^-<Key> can be done using C-q)
inoremap <C-V>  <Esc>"*pa

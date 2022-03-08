" Set space as a leader key
map <Space> <leader>

" Create splits
nnoremap <leader>s :sp<CR>
nnoremap <leader>v :vsp<CR>

" Move between splits
nnoremap <silent> <C-S-Left> :wincmd h<CR>
nnoremap <silent> <C-S-Down> :wincmd j<CR>
nnoremap <silent> <C-S-Up> :wincmd k<CR>
nnoremap <silent> <C-S-Right> :wincmd l<CR>

" Move between buffers
nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left> :bprev<CR>
nnoremap <leader>c :close<CR>
nnoremap <leader>d :bdelete<CR>

" Save file
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wall<CR>

" Clear search input
nnoremap <leader>z :noh<CR>

" Search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Apply macros
nnoremap Q @q
vnoremap Q :norm @q<CR>

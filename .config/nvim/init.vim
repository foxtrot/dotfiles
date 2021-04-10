"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMRC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"" Code Completion, Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/html5.vim'

"" NerdTREE
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

"" Git Gutter
Plug 'airblade/vim-gitgutter'

"" Indent Guide
Plug 'Yggdroot/indentLine'

"" Airline Status Bar, Git
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

"" Dracula
Plug 'dracula/vim', { 'as': 'dracula' }

"" File Search
Plug 'ctrlpvim/ctrlp.vim'

"" Color Table
Plug 'guns/xterm-color-table.vim'

Plug 'jszakmeister/vim-togglecursor'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTREE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open on Startup
"autocmd VimEnter * NERDTreeTabsOpen
"autocmd VimEnter * wincmd p

" Close on Shutdown
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

" Bind CTRL+/ to Toggle Tree
nmap <C-_> :NERDTreeTabsToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'
let g:gitgutter_set_sign_backgrounds = 1
au VimEnter * GitGutterEnable
set signcolumn=auto

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation Guide
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_setColors = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indentLine_enabled = 1

set conceallevel=0
set list listchars=tab:\|\ ,trail:·,extends:»,precedes:«,nbsp:×
let g:indentLine_setConceal = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline Status
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 0
"let g:airline_theme='bubblegum'
let g:airline_theme='dracula'
" let g:airline#extensions#tabline#enabled = 1
let g:airline_section_a = '%#__accent_bold#%{airline#util#wrap(airline#parts#mode(),0)}%#__restore__#%{airline#util#append(airline#parts#crypt(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append(airline#extensions#keymap#status(),0)}%{airline#util#append(airline#parts#spell(),0)}%{airline#util#append("",0)}%{airline#util#append("",0)}%{airline#util#append(airline#parts#iminsert(),0)}'
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#hunks#get_hunks(),100)}%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'
let g:airline_section_c = '%<%<%{airline#extensions#fugitiveline#bufname()}%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%{airline#util#wrap(airline#extensions#coc#get_status(),0)}%#__restore__#'
let g:airline_section_gutter = '%='
let g:airline_section_x = '%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#wrap(airline#parts#filetype(),0)}'
let g:airline_section_y = '0x%B | %{airline#util#wrap(airline#parts#ffenc(),0)}'
let g:airline_section_z = '%p%% %#__accent_bold#%l%#__restore__#%#__accent_bold#/%L%#__restore__# %v'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#whitespace#check(),0)}%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
syntax on
colorscheme dracula
set numberwidth=5
set cmdheight=1
set linespace=1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
highlight clear SignColumn
highlight clear LineNr
set t_Co=256
let &t_SI = "\<Esc>[6 q"
let &t_rR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code Completion and Linting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

source ~/.config/nvim/coc.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits / Panes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright
nnoremap <C-S-Right> <C-w>l
nnoremap <C-S-Left> <C-w>h
nnoremap <C-S-Up> <C-w>k
nnoremap <C-S-Down> <C-w>j

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev te tabedit
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Left> :tabprev<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-m> :tabclose<CR>
unmap <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Manipulation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Mode
"nnoremap <Left> <gv
"nnoremap <Right> >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helpers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev W w 
command ViewDiff :w !diff % -
cnoreabbrev vd ViewDiff


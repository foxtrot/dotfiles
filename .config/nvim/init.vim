"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMRC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Defined Binds
" gd - Goto Definiton
" gy - Goto Implementation
" gi - Show References
" gr - Show Hint
"
" Space-a - Show Diagnostics
" Space-e - Show Extensions
" Space-c - Show Commands
" Space-o - Find Current Symbol in File
" Space-s - Search for Symbol
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"" Code Completion, Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/html5.vim'

"" Indent Guide
Plug 'lukas-reineke/indent-blankline.nvim'

"" Tabline
Plug 'akinsho/bufferline.nvim'

"" LuaLine Status Bar
Plug 'nvim-lualine/lualine.nvim'

"" Git
Plug 'tpope/vim-fugitive'

"" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"" TokyoNight Theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

"" Color Table
Plug 'guns/xterm-color-table.vim'

"" Structure View
Plug 'liuchengxu/vista.vim'

"" Multi Cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"" Misc
Plug 'jszakmeister/vim-togglecursor'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'junegunn/rainbow_parentheses.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
syntax on

let g:tokyonight_style = "night"
colorscheme tokyonight
hi! DiffAdd guibg=#1a1b26 guifg=#98be65
hi! DiffChange guibg=#1a1b26 guifg=#ff8800
hi! DiffDelete guibg=#1a1b26 guifg=#db4b4b

set termguicolors
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
set signcolumn=auto
autocmd VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc Key Re-bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <SPACE> <Nop>
let mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_nvim_statusline = 0 " disable statusline overwriting

nnoremap <silent> <C-P> :Commands<CR>
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>t :Vista finder coc<CR>
nnoremap <silent> <leader>? :History<CR>

nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR><CR>
nnoremap <silent> <leader>. :AgIn 

nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

let g:fzf_colors =
            \ { 'fg':    ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'Normal'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Tree (coc-explorer)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bind CTRL+/ to Toggle Tree
nmap <C-_> :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vista configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:vista_default_executive = 'coc'
let g:vista_blink  = [0, 0]
let g:vista_sidebar_width = 60
let g:vista_finder_alternative_executives = ['coc']
"let g:vista#renderer#enable_icon = 0
map <C-t> :Vista!!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation Guide
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    show_end_of_line = false,
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BufferLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("bufferline").setup{}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LuaLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
luafile ~/.config/nvim/lualine.lua

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
nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left> :bprev<CR>
nnoremap <C-n> :enew<CR>
nnoremap <C-m> :bdelete<CR>
unmap <CR>
" Always keep cursor slighly higher than large buffer end
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/4
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Manipulation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Mode
"nnoremap <Left> <gv
"nnoremap <Right> >gv
" Visual Multi configuration
let g:VM_maps = {}
let g:VM_maps["Undo"]      = 'u'
let g:VM_maps["Redo"]      = '<C-r>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helpers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev W w 
command ViewDiff :w !diff % -
cnoreabbrev vd ViewDiff
set mouse=a

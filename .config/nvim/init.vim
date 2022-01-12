""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMRC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader - SPACE
"
" gd - Goto Definiton
" gy - Goto Type Implementation
" gi - Goto Implementation
" gr - Show References
" gr - Show Hint
"
" rn - Rename Symbol
" f  - Format Selected Text
"
" Leader-space - Open File Search
" Leader-b     - Open Buffers
" Leader-w     - Open Windows
" Leader-;     - Open Buffer Lines
" Leader-o     - Tags Window
" Leader-?     - Vim History
" Leader-/  - Silver Search
" Leader-gl - Tree Git Commits
" Leader-ga - File Git Commits
" Leader-ft - File Type Selection
" Leader-a  - Apply Code Action to Selection
" Leader-ac - Apply Code Fix to Current Line
" Leader-qf - Apply Auto Code Fix to Current Line
" Leader-z  - CoC Fuzzy List
" Leader-d  - Show Diagnostics
" Leader-b  - Show Diagnostics for Current Buffer
" Leader-c  - CoC Commands
" Leader-l  - CoC Location
" Leader-o  - CoC Outline
" Leader-s  - CoC Symbols
"
" CTRL-space - Trigger Completion
" CTRL-/     - Open File Tree
" CTRL-t     - Open Tag Tree
" CTRL-c     - Vim Commands
" CTRL-[     - Previous Diagnostic
" CTRL-]     - Next Diagnostic
"
" CTRL-SHIFT-RIGHT - Switch Pane to Right
" CTRL-SHIFT-LEFT  - Switch Pane to Left
" CTRL-SHIFT-UP    - Switch Pane Upwards
" CTRL-SHIFT-DOWN  - Switch Pane Downwards
" CTRL-RIGHT       - Switch Buffer to Right
" CTRL-LEFT        - Switch Buffer to Left
" CTRL-m           - Delete Buffer
"
"
" :Format - Format Current Buffer
" :Fold   - Fold Current Buffer
" :Unfold - Unfold Current Buffer
" :OR     - Organize Imports
" 
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"" Code Completion, Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/html5.vim'
Plug 'antoinemadec/coc-fzf'

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
hi! CocErrorHighlight gui=underline guisp=#db4b4b
hi! CocWarningHighlight gui=underline guisp=#ff8800
hi! CocInfoHighlight gui=underline guisp=#0db9d7
hi! CocHintHighlight gui=underline guisp=#

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
let &t_Cs = "\<Esc>[4:3m"
let &t_Ce = "\<Esc>[4:0m"

set cinoptions=(g0,+2,(0,i0,t0,:0)

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

nnoremap <silent> <C-c> :Commands<CR>
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>? :History<CR>

nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR><CR>

nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

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

require("indent_blankline").setup {
    show_end_of_line = true,
    filetype_exclude = { "coc-explorer" },
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
" Visual Multi co:nfiguration
nmap <C-d> <Plug>(VM-Find-Under)
imap <C-d> <Esc><Plug>(VM-Find-Under)
let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helpers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev W w 
command ViewDiff :w !diff % -
cnoreabbrev vd ViewDiff
set mouse=a

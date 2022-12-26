set clipboard+=unnamedplus
set cmdheight=1
set completeopt=menu,menuone,noselect
set expandtab
set foldmethod=syntax
set ignorecase
set nobackup
set nofoldenable
set noswapfile
set nowrap
set nowritebackup
set number
set scrolloff=12
set shiftwidth=2
set shortmess+=c
set signcolumn=yes
set smartindent
set splitbelow
set splitright
set termguicolors
set undofile
set updatetime=300
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.svg,*.png,*.jpg,*.gif,node_modules
set mouse=a
set encoding=UTF-8

set cinoptions=(g0,+2,(0,i0,t0,:0)

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

au VimEnter * :set showtabline=0

autocmd FileType elm setlocal shiftwidth=4 tabstop=4

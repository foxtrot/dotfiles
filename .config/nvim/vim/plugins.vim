let data_dir = stdpath('data') . '/site'

if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:plug_window = 'new'

call plug#begin(stdpath('data') . 'vimplug')

" Snippet Engine
Plug 'L3MON4D3/LuaSnip'

" LSP and Helpers
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Find, Filter, Preview and Pick
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" AutoCompletion and associated plugins
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'

" Icon support
Plug 'kyazdani42/nvim-web-devicons'

" Git gutter signs
Plug 'lewis6991/gitsigns.nvim'

" Format runner
Plug 'mhartington/formatter.nvim'

" Lua helpers
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

" Line
Plug 'nvim-lualine/lualine.nvim'

" Buffer Line
Plug 'akinsho/bufferline.nvim'

" Indent marker
" Plug 'lukas-reineke/indent-blankline.nvim'

" Colorscheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Comment out lines
Plug 'tpope/vim-commentary'

" Git integration
Plug 'tpope/vim-fugitive'

" Plugins can now use '.'
Plug 'tpope/vim-repeat'

" Easier way to add/change/delete pairs of {}, '', etc.
Plug 'tpope/vim-surround'

" Useful bracket bindings
Plug 'tpope/vim-unimpaired'

" Full diagnostics view
Plug 'folke/trouble.nvim'

call plug#end()

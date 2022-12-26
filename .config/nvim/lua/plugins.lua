return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP, Completion & Diagnostics
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'ray-x/lsp_signature.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind-nvim'
  use 'folke/trouble.nvim'

  -- Colorscheme & Theme
  use 'folke/tokyonight.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Lua & Plugin Helpers
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- Line
  use 'nvim-lualine/lualine.nvim'

  -- Buffer Line
  use 'akinsho/bufferline.nvim'

  -- File Explorer & Code Navigation
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Source Code Management
  use 'lewis6991/gitsigns.nvim'
  use 'mhartington/formatter.nvim'
end)
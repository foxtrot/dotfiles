require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash',
    'comment',
    'c',
    'cpp',
    'css',
    'dockerfile',
    'fish',
    'go',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'jsonc',
    'lua',
    'scss',
    'tsx',
    'typescript',
    'yaml',
    'vim'
  },
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = false
  },
  indent = {
    enable = true
  }
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- Options default for silent mappings
local silentopts = { noremap = true, silent = true }

-- Configure leader
vim.g.mapleader = ' '

-- Create splits
vim.api.nvim_set_keymap('n', '<leader>s', ':sp', opts)
vim.api.nvim_set_keymap('n', '<leader>v', ':vsp', opts)

-- Move between splits
vim.api.nvim_set_keymap('n', '<C-S-Left>', ':wincmd h', opts)
vim.api.nvim_set_keymap('n', '<C-S-Down>', ':wincmd j', opts)
vim.api.nvim_set_keymap('n', '<C-S-Up>', ':wincmd k', opts)
vim.api.nvim_set_keymap('n', '<C-S-Right>', ':wincmd l', opts)

-- Move between buffers
vim.api.nvim_set_keymap('n', '<C-Left>', ':bnext', opts)
vim.api.nvim_set_keymap('n', '<C-Right>', ':bprev', opts)
vim.api.nvim_set_keymap('n', '<leader>c', ':close', opts)
vim.api.nvim_set_keymap('n', '<leader>d', ':bdelete', opts)

-- Save file
vim.api.nvim_set_keymap('n', '<leader>w', ':w', opts)
vim.api.nvim_set_keymap('n', '<leader>W', ':wall', opts)

-- Clear search highlight
vim.api.nvim_set_keymap('n', '<leader>z', ':noh', opts)

-- Search for visually selected text
vim.api.nvim_set_keymap('v', '//', 'y/\\V<C-R>=escape(@",\'/\')')
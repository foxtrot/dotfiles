-- Options default for silent mappings
local silentops = { noremap = true, silent = true }

-- Configure leader
vim.g.mapleader = ' '

-- Create splits
vim.api.nvim_set_keymap('n', '<leader>s', ':sp', silentops)
vim.api.nvim_set_keymap('n', '<leader>v', ':vsp', silentops)

-- Move between splits
vim.api.nvim_set_keymap('n', '<C-S-Left>', ':wincmd h', silentops)
vim.api.nvim_set_keymap('n', '<C-S-Down>', ':wincmd j', silentops)
vim.api.nvim_set_keymap('n', '<C-S-Up>', ':wincmd k', silentops)
vim.api.nvim_set_keymap('n', '<C-S-Right>', ':wincmd l', silentops)

-- Move between buffers
vim.api.nvim_set_keymap('n', '<C-Left>', ':bnext', silentops)
vim.api.nvim_set_keymap('n', '<C-Right>', ':bprev', silentops)
vim.api.nvim_set_keymap('n', '<leader>c', ':close', silentops)
vim.api.nvim_set_keymap('n', '<leader>d', ':bdelete', silentops)

-- Save file
vim.api.nvim_set_keymap('n', '<leader>w', ':w', silentops)
vim.api.nvim_set_keymap('n', '<leader>W', ':wall', silentops)

-- Clear search highlight
vim.api.nvim_set_keymap('n', '<leader>z', ':noh', silentops)

-- Search for visually selected text
vim.api.nvim_set_keymap('v', '//', 'y/\\V<C-R>=escape(@",\'/\')')
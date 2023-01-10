-- Misc settings
vim.opt.clipboard = 'unamedplus'
vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.nowrap = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.noswapfile = true
vim.opt.mouse = 'a'
vim.opt.cmdheight = 1
vim.opt.encoding = 'UTF-8'
vim.opt.scrolloff = 12
vim.opt.updatetime = 300
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.wildignore:append({'*/tmp/*', '*.so', '*.swp', '*.zip', '*.svg', '*.png', '*.jpg', '*.gif', 'node_modules'})
vim.opt.shortmess:append('c')

-- Spacing
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Indentation
vim.opt.smartindent = true
vim.opt.cinoptions = {'g0', '+2', '(0', 'i0', 't0', ':0'}

-- Folding
vim.opt.foldmethod = 'syntax'
vim.opt.nofoldenable = true

-- Split
vim.opt.splitbelow = true
vim.opt.splitright = true
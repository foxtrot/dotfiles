-- Codesearch
vim.api.nvim_create_user_command('Cs', 'Telescope codesearch find_query', {})
vim.api.nvim_create_user_command('Cf', 'Telescope codesearch find_file', {})

-- Workspaces
vim.api.nvim_create_user_command('Ws', function()
	    require('neocitc').pick_workspace()
	end,
	{}
)
-- Google specific commands
local ok, google = pcall(require, 'google')
if ok then
    -- CS
    vim.api.nvim_create_user_command('Cs', google.cs_query, {})
    vim.api.nvim_create_user_command('Cse', google.cs_query_exp, {})
    vim.api.nvim_create_user_command('Cf', google.cs_files, {})
    vim.api.nvim_create_user_command('Cfe', google.cs_files_exp, {})

    -- Workspaces
    vim.api.nvim_create_user_command('Ws', google.pick_ws, {})
    vim.api.nvim_create_user_command('Wsn', google.new_ws, {nargs = 1})
    vim.api.nvim_create_user_command('Wsnf', google.new_ws_fig, {nargs = 1})
end

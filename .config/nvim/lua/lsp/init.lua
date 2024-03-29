local common = require('lsp/common')
local util = require 'lspconfig.util'

-- TypeScript
_G.organize_imports = function ()
  vim.lsp.buf.execute_command {
    command = '_typescript.organizeImports',
    arguments = {
      vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
    }
  }
end
require('lspconfig').tsserver.setup {
  on_attach = function (client)
    common.on_attach()
    common.disable_formatting(client)
    vim.cmd('command! Organize lua organize_imports()')
  end,
  capabilities = common.capabilities
}

-- JavaScript
require('lspconfig').eslint.setup(common.no_formatting_config)

-- Bash
require('lspconfig').bashls.setup(common.default_config)

-- CSS
require('lspconfig').cssls.setup(common.no_formatting_config)

-- Go
require('lspconfig').gopls.setup{
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            vulncheck = "Imports",
        },
    },
    on_attach = common.on_attach
}

-- HTML
require('lspconfig').html.setup(common.no_formatting_config)

-- JSON, YAML
require('lspconfig').jsonls.setup(common.no_formatting_config)
require('lspconfig').yamlls.setup(common.no_formatting_config)

-- C, C++
require('lspconfig').clangd.setup(common.no_formatting_config)

-- CMake
require('lspconfig').cmake.setup(common.no_formatting_config)

-- Python
require('lspconfig').pyright.setup(common.default_config)

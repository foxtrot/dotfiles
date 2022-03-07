local cmp = require('cmp')
local snip = require('luasnip')
local lspkind = require('lspkind')

local config = {
    documentation = {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,

            before = function (entry, vim_item)
                local source_names = {
                    buffer = "[Buffer]",
                    luasnip = "[Snippet]",
                    nvim_lsp = "[LSP]",
                }
                vim_item.menu = source_names[entry.source.name]

                return vim_item
            end
        })
    },
    mapping = {
        -- Insert option
        ['<C-Space>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
        ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, setup = true }),
        ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
        -- Scroll doc
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- Close
        ['<C-e>'] = cmp.mapping.close(),
        -- Option selection
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        -- Tab and Shift-Tab option cycling
        ['<Tab>'] = function (fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snip.expand_or_jumpable() then
                snip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function (fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif snip.jumpable(-1) then
                snip.jump(-1)
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' },
    },
    snippet = { expand = function(args) snip.lsp_expand(args.body) end },
}

cmp.setup(config)

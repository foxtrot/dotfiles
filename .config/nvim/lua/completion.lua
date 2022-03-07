local cmp = require('cmp')
local types = require("cmp.types")
local str = require("cmp.utils.str")
local snip = require('luasnip')
local lspkind = require('lspkind')

local config = {
    documentation = {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,

            before = function(entry, vim_item)
                -- Get the full snippet (and only keep first line)
                local word = entry:get_insert_text()
                if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
                    word = vim.lsp.util.parse_snippet(word)
                end
                word = str.oneline(word)

                if
                    entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet and string.sub(vim_item.abbr, -1, -1) == "~"
                then
                    word = word
                end
                vim_item.abbr = word

                return vim_item
            end,
        }),
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
    },
    snippet = { expand = function(args) snip.lsp_expand(args.body) end },
}

cmp.setup(config)

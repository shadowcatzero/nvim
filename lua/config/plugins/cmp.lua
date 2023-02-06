return function(use)
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require 'cmp'
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<c-space>'] = cmp.mapping.complete(),
                    ['<c-e>'] = cmp.mapping.abort(),
                    ['<cr>'] = cmp.mapping.confirm({ select = true }),
                    ['<tab>'] = cmp.mapping.select_next_item(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                    { name = 'neorg' },
                }),
            })
        end
    }

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
end

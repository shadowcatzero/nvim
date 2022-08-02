require 'telescope'.load_extension('ui-select')

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
require 'neo-tree'.setup {
    filesystem = {
        filtered_items = {
            visible = true,
        }
    },
    window = {
        width = 30,
    },
}

require 'nvim-treesitter.configs'.setup {
    highlight = { enable = true }
}

require 'lualine'.setup()

local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = require 'config.mappings.cmp' (cmp),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    }),
})

require 'nvim-autopairs'.setup {}

if vim.o.termguicolors then
    require 'colorizer'.setup()
end

require('gitsigns').setup()


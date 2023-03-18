local config = function()
    local cmp = require("cmp")
    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs( -4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<c-h>"] = cmp.mapping.complete(),
            ["<c-e>"] = cmp.mapping.abort(),
            ["<cr>"] = cmp.mapping.confirm({ select = true }),
            ["<tab>"] = cmp.mapping.select_next_item(),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" },
            { name = "neorg" },
        }),
    })
end

return {
    {
        "hrsh7th/nvim-cmp",
        config = config,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        }
    },
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
}

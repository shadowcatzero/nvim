return {
    -- {
    --     "nvim-neorg/neorg",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     config = function()
    --         require("neorg").setup {
    --             load = {
    --                 ["core.defaults"] = {},
    --                 ["core.concealer"] = {},
    --                 ["core.completion"] = {
    --                     config = {
    --                         engine = "nvim-cmp"
    --                     }
    --                 },
    --                 ["core.export"] = {},
    --             }
    --         }
    --     end,
    -- },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end,
    },
}

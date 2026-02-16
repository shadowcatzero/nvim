return {
    -- {
    --     "mrcjkb/rustaceanvim",
    --     ft = { "rust" },
    --     version = '^7',
    --     lazy = false,
    -- },
    {
        "windwp/nvim-autopairs",
        config = function() require "nvim-autopairs".setup {} end
    },
    {
        "scalameta/nvim-metals",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "numToStr/Comment.nvim",
        config = function() require "Comment".setup {} end
    },
    "mfussenegger/nvim-jdtls",
    "mfussenegger/nvim-dap",
    "folke/neodev.nvim",
    {
        "williamboman/mason.nvim",
        config = function() require "mason".setup { } end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function() require "mason-lspconfig" end,
    },
}

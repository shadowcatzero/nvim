return {
    {
        "simrat39/rust-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function() require "rust-tools".setup {} end
    },
    {
        "windwp/nvim-autopairs",
        config = function() require "nvim-autopairs".setup {} end
    },
    {
        "scalameta/nvim-metals",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "mfussenegger/nvim-jdtls",
    "folke/neodev.nvim",
}

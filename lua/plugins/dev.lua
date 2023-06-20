local rt_config = function()
    local rt = require "rust-tools"
    rt.setup {
        server = {
            -- on_attach = function(_, bufnr)
            --     vim.keymap.set("n", "<C-k>", rt.hover_actions.hover_actions, { buffer = bufnr })
            --     vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            -- end
        }
    }
end
return {
    {
        "simrat39/rust-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
        config = rt_config
    },
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
}

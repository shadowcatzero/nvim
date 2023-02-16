return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup {}

            local u = require("config.utils").mapping

            u.cmd("<leader>ff", "Telescope find_files")
            u.cmd("<leader>fg", "Telescope live_grep")
            u.cmd("<leader>fb", "Telescope buffers")
            u.cmd("<leader>fh", "Telescope help_tags")
        end
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function() require("telescope").load_extension("fzf") end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function() require("telescope").load_extension("ui-select") end
    },
    {
        "ziontee113/icon-picker.nvim",
        dependencies = { "stevearc/dressing.nvim" },
        config = function()
            require("icon-picker").setup {}
            local u = require("config.utils").mapping
            u.cmd("<leader>fi", "IconPickerYank alt_font symbols nerd_font emoji")
            vim.keymap.set("i", "<c-s>", "<cmd>IconPickerInsert alt_font symbols nerd_font emoji<cr>")
        end,
    }
}

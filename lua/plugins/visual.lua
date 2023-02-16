return {
    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup { style = "darker" }
            require("onedark").load()
            package.loaded["config.theme"] = nil
            require("config.theme")
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            if vim.o.termguicolors then
                require("colorizer").setup()
            end
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("lualine").setup {}
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup() end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update {
                with_sync = true
            }
        end,
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "norg" },
                highlight = { enable = true }
            }
        end,
    },
    "elkowar/yuck.vim",
    "kmonad/kmonad-vim"
}

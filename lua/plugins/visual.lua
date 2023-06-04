return {
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                transparent_background = true
            })
            vim.cmd.colorscheme("catppuccin-mocha")
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
            require("lualine").setup {
                options = {
                    theme = "catppuccin"
                }
            }
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                _signs_staged_enable = true
            })
        end
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
                highlight = { enable = true }
            }
        end,
    },
    "elkowar/yuck.vim",
    "kmonad/kmonad-vim"
}

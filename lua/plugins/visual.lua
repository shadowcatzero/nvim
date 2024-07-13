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
        "norcalli/nvim-colorizer.lua",
        config = function()
            if vim.o.termguicolors then
                require("colorizer").setup()
            end
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        lazy = false,
        enabled = true,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter.configs").setup {
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                textobjects = {
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]F"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["kf"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["kc"] = "@class.inner",
                            ["ap"] = "@parameter.outer",
                            ["kp"] = "@parameter.inner",
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>so"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>sn"] = "@parameter.inner",
                        },
                    },
                },
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update {
                with_sync = true
            }
        end,
    },
    "elkowar/yuck.vim",
    "kmonad/kmonad-vim"
}

return function(use)
    use {
        'navarasu/onedark.nvim',
        config = function()
            require 'onedark'.setup { style = 'darker' }
            require 'onedark'.load()
            package.loaded['config.theme'] = nil
            require 'config.theme'
        end
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            if vim.o.termguicolors then
                require 'colorizer'.setup()
            end
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require 'lualine'.setup {}
            -- refresh bar when cursor moved to update line & col
            local cb = function()
                require 'lualine'.refresh {
                    scope = 'window',
                    place = { 'statusline' },
                }
            end
            --[[local group = vim.api.nvim_create_augroup('lualine', {})
            vim.api.nvim_create_autocmd('CursorMoved', {
                group = group,
                callback = cb
            })]]
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require 'gitsigns'.setup() end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require 'nvim-treesitter.install'.update {
                with_sync = true
            }
        end,
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = {"norg"},
                highlight = { enable = true }
            }
        end,
    }
    use {
        'elkowar/yuck.vim'
    }
    use {
        'kmonad/kmonad-vim'
    }
end

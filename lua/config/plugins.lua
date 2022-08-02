local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

local packer = require('packer')
packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- files
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require 'config.plugins.telescope' end
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        requires = { 'nvim-telescope/telescope.nvim' },
        -- doesn't work?
        -- config = function() require 'telescope'.load_extension('fzf') end
    }
    use {
        'nvim-telescope/telescope-ui-select.nvim',
        requires = { 'nvim-telescope/telescope.nvim' },
        config = function() require 'telescope'.load_extension('ui-select') end
    }
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v2.x",
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim'
        },
        config = function() require 'config.plugins.neotree' end
    }

    -- syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update { with_sync = true }
        end,
        config = function()
            require 'nvim-treesitter.configs'.setup {
                highlight = { enable = true }
            }
        end,
    }

    -- autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require 'config.plugins.cmp'
        end
    }

    -- snippets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- autopairs
    use {
        'windwp/nvim-autopairs',
        config = function() require 'nvim-autopairs'.setup {} end
    }

    -- lsp
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require 'config.plugins.lspconfig'
        end
    }
    use {
        'simrat39/rust-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'mfussenegger/nvim-dap',
        }
    }
    use 'tjdevries/nlua.nvim'

    -- visual
    use {
        'navarasu/onedark.nvim',
        config = function()
            require 'onedark'.setup { style = 'darker' }
            require 'onedark'.load()
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
        config = function() require 'lualine'.setup() end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require 'gitsigns'.setup() end
    }

    -- sync if bootstrapped
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)

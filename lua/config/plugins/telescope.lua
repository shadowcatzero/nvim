return function(use)
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require 'telescope'.setup {}

            local u = require 'config.utils'

            u.nmap('<space>ff', u.cmd('Telescope find_files'))
            u.nmap('<space>fg', u.cmd('Telescope live_grep'))
            u.nmap('<space>fb', u.cmd('Telescope buffers'))
            u.nmap('<space>fh', u.cmd('Telescope help_tags'))
        end
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
end


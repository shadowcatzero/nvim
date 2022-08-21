return function(use)
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v2.x",
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim'
        },
        config = function()
            vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]
            require 'neo-tree'.setup {
                filesystem = {
                    filtered_items = {
                        visible = true,
                    }
                },
                window = {
                    width = 30,
                },
            }

            local u = require 'config.utils'.mapping
            u.cmd('<leader>e', 'Neotree toggle')
        end
    }
end

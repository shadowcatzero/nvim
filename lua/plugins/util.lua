return {
    {
        'nvim-neorg/neorg',
        tag = '0.0.12',
        config = function()
            require('neorg').setup {
                load = {
                    ['core.defaults'] = {},
                    ['core.norg.concealer'] = {},
                    ['core.norg.completion'] = {
                        config = {
                            engine = 'nvim-cmp'
                        }
                    },
                    ['core.export'] = {},
                }
            }
        end,
        dependencies = 'nvim-lua/plenary.nvim'
    },
}

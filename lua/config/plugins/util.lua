return function(use)
    use {
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
        requires = 'nvim-lua/plenary.nvim'
    }
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    vim.cmd([[
        function! OpenMarkdownPreview (url)
            execute "silent ! firefox --new-window " . a:url
        endfunction
        let g:mkdp_browserfunc = 'OpenMarkdownPreview'
    ]])
end

local config = function()
    local settings = require 'config.lsp-settings'
    local on_attach = settings.on_attach
    local capabilities = settings.capabilities

    require 'lspconfig'.sumneko_lua.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    }

    require 'rust-tools'.setup {
        server = {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    }

    vim.g.markdown_fenced_languages = {
        "ts=typescript"
    }
    require 'lspconfig'.denols.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    require 'lspconfig'.clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    require 'lspconfig'.asm_lsp.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    require 'lspconfig'.pylsp.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    require'lspconfig'.kotlin_language_server.setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

return function(use)
    use {
        'neovim/nvim-lspconfig',
        config = config
    }
    use {
        'simrat39/rust-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'mfussenegger/nvim-dap',
        }
    }
    use {
        'windwp/nvim-autopairs',
        config = function() require 'nvim-autopairs'.setup {} end
    }
    use {
        'scalameta/nvim-metals',
        requires = { "nvim-lua/plenary.nvim" }
    }
    use 'mfussenegger/nvim-jdtls'
end

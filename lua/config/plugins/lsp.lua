local config = function()
    local u = require 'config.utils'.mapping

    u.nmap('E', vim.diagnostic.open_float)
    u.nmap('[d', vim.diagnostic.goto_prev)
    u.nmap(']d', vim.diagnostic.goto_next)
    u.nmap('<space>q', vim.diagnostic.setloclist)

    local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        vim.o.signcolumn = 'yes'

        local map = function(from, to)
            vim.keymap.set('n', from, to,
                { noremap = true, silent = true, buffer = bufnr }
            )
        end

        map('gd', vim.lsp.buf.definition)
        map('gr', vim.lsp.buf.references)
        map('gi', vim.lsp.buf.implementation)
        map('gD', vim.lsp.buf.declaration)

        map('K', vim.lsp.buf.hover)
        map('<C-k>', vim.lsp.buf.signature_help)

        map('<space>wa', vim.lsp.buf.add_workspace_folder)
        map('<space>wr', vim.lsp.buf.remove_workspace_folder)
        map('<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end)
        map('<space>D', vim.lsp.buf.type_definition)
        map('<space>rn', vim.lsp.buf.rename)
        map('<space>ca', vim.lsp.buf.code_action)
        map('<space>fm', vim.lsp.buf.formatting)
    end

    local capabilities = require 'cmp_nvim_lsp'.update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    )

    require 'lspconfig'.sumneko_lua.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true)
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
end

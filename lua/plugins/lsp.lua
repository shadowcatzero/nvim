local config = function()
    local settings = require("config.lsp-settings")
    local on_attach = settings.on_attach
    local capabilities = settings.capabilities

    require("lspconfig").lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
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

    vim.g.markdown_fenced_languages = {
        "ts=typescript"
    }
    require("lspconfig").denols.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    require("lspconfig").clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    require("lspconfig").asm_lsp.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    require("lspconfig").pylsp.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    require("lspconfig").kotlin_language_server.setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

local rs_config = function()
    local settings = require "config.lsp-settings"
    local on_attach = settings.on_attach
    local capabilities = settings.capabilities
    require "rust-tools".setup {
        server = {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    }
end

return {
    {
        "neovim/nvim-lspconfig",
        config = config
    },
    {
        "simrat39/rust-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
        rs_config = rs_config
    },
    {
        "windwp/nvim-autopairs",
        config = function() require "nvim-autopairs".setup {} end
    },
    {
        "scalameta/nvim-metals",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "mfussenegger/nvim-jdtls",
    "folke/neodev.nvim"
}

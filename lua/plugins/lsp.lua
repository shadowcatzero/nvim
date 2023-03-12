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
    local c = require("lspconfig")
    c.clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    c.asm_lsp.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    c.pylsp.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    c.kotlin_language_server.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    c.denols.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = c.util.root_pattern("deno.json", "deno.jsonc"),
    }
    c.angularls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    c.tsserver.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = c.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
        single_file_support = false,
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
        config = rs_config
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

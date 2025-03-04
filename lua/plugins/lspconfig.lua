local config = function()
    local c = require("lspconfig")

    vim.g.markdown_fenced_languages = {
        "ts=typescript"
    }

    c.lua_ls.setup {
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
    c.denols.setup {
        root_dir = c.util.root_pattern("deno.json", "deno.jsonc"),
    }
    c.ts_ls.setup {
        root_dir = c.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
        single_file_support = false,
    }
    c.csharp_ls.setup {}

    c.angularls.setup {}
    c.clangd.setup {}
    c.asm_lsp.setup {}
    c.pylsp.setup {}
    c.kotlin_language_server.setup {}
    c.texlab.setup {
        settings = {
            texlab = {
                build = {
                    args = { "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f", "-outdir=build" },
                    onSave = true
                }
            }
        }
    }
    c.wgsl_analyzer.setup {}
    c.hls.setup {}
    c.slint_lsp.setup {}
    c.tinymist.setup {
        root_dir = "-",
        settings = {
            exportPdf = "onSave",
            formatterMode = "typstyle",
        }
    }

    require('mason').setup()
    require('mason-lspconfig').setup()

    require 'config.lsp-settings'
end

return {
    {
        "neovim/nvim-lspconfig",
        config = config,
        dependencies = { "williamboman/mason-lspconfig.nvim"},
    },
}

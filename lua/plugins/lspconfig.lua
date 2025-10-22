local config = function()
    local c = vim.lsp.config

    vim.g.markdown_fenced_languages = {
        "ts=typescript"
    }

    c["lua_ls"] = {
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
    c["denols"] = {}
    c["ts_ls"] = {}
    c["csharp_ls"] = {}

    c["angularls"] = {}
    c["clangd"] = {}
    c["asm_lsp"] = {}
    c["pylsp"] = {}
    c["kotlin_language_server"] = {}
    c["texlab"] = {
        settings = {
            texlab = {
                build = {
                    args = { "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f", "-outdir=build" },
                    onSave = true
                }
            }
        }
    }
    c["wgsl_analyzer"] = {}
    c["hls"] = {}
    c["slint_lsp"] = {}
    c["tinymist"] = {
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
        dependencies = { "williamboman/mason-lspconfig.nvim" },
    },
}

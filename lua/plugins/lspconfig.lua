local config = function()
    local lsp = vim.lsp
    vim.g.markdown_fenced_languages = {
        "ts=typescript"
    }

    lsp.config["lua_ls"] = {
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
    lsp.enable("denols")
    lsp.enable("csharp_ls")

    lsp.enable("angularls")
    lsp.enable("clangd")
    lsp.enable("asm_lsp")
    lsp.enable("pylsp")
    lsp.enable("kotlin_language_server")
    lsp.config["texlab"] = {
        settings = {
            texlab = {
                build = {
                    args = { "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f", "-outdir=build" },
                    onSave = true
                }
            }
        }
    }
    lsp.enable("wgsl_analyzer")
    lsp.enable("hls")
    lsp.enable("slint_lsp")
    lsp.config["tinymist"] = {}
    lsp.config["wgsl_analyzer"] = {}
    lsp.config["hls"] = {}
    lsp.config["slint_lsp"] = {}
    lsp.config["tinymist"] = {
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

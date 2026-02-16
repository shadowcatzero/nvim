local config = function()
    vim.g.markdown_fenced_languages = {
        "ts=typescript"
    }

    vim.lsp.config("lua_ls", {
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
    })
    vim.lsp.enable("denols")
    vim.lsp.enable("csharp_ls")
    vim.lsp.enable("rust_analyzer")

    vim.lsp.enable("angularls")
    vim.lsp.enable("clangd")
    vim.lsp.enable("asm_lsp")
    vim.lsp.enable("pylsp")
    vim.lsp.enable("kotlin_language_server")
    vim.lsp.config("texlab", {
        settings = {
            texlab = {
                build = {
                    args = { "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f", "-outdir=build" },
                    onSave = true
                }
            }
        }
    })
    vim.lsp.enable("wgsl_analyzer")
    vim.lsp.enable("hls")
    vim.lsp.enable("slint_lsp")
    vim.lsp.config("tinymist", {
        root_dir = "-",
        settings = {
            exportPdf = "onSave",
            formatterMode = "typstyle",
        }
    })

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

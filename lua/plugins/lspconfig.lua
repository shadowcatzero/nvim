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
    c.tsserver.setup {
        root_dir = c.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
        single_file_support = false,
    }
    c.omnisharp.setup {
        cmd = { "omnisharp" },

        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = false,
        enable_roslyn_analyzers = false,
        organize_imports_on_format = false,
        enable_import_completion = false,
        sdk_include_prereleases = true,
        analyze_open_documents_only = false,
    }
    c.typst_lsp.setup {
        cmd = { "/home/bryan/repos/typst-lsp/target/release/typst-lsp" },
    }

    c.angularls.setup {}
    c.clangd.setup {}
    c.asm_lsp.setup {}
    c.pylsp.setup {}
    c.kotlin_language_server.setup {}
    c.jsonls.setup {}
    c.texlab.setup {
        settings = {
            texlab = {
                build = {
                    onSave = true
                }
            }
        }
    }

    require 'config.lsp-settings'
end

return {
    {
        "neovim/nvim-lspconfig",
        config = config
    },
}

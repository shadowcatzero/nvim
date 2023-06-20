vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        vim.o.signcolumn = "yes"

        local map = function(from, to)
            vim.keymap.set("n", from, to,
                { noremap = true, silent = true, buffer = ev.buf }
            )
        end

        local builtin = require('telescope.builtin')
        local dap = require('dap')

        map("gd", builtin.lsp_definitions)
        map("gr", builtin.lsp_references)
        map("gi", builtin.lsp_implementations)
        map("gs", builtin.lsp_document_symbols)
        map("gD", vim.lsp.buf.declaration)

        map("K", vim.lsp.buf.hover)
        map("<C-k>", vim.lsp.buf.signature_help)

        map("<leader>wa", vim.lsp.buf.add_workspace_folder)
        map("<leader>wr", vim.lsp.buf.remove_workspace_folder)
        map("<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end)
        map("<leader>D", vim.lsp.buf.type_definition)
        map("<leader>rn", vim.lsp.buf.rename)
        map("<leader>a", vim.lsp.buf.code_action)
        map("<leader>fm", function()
            vim.lsp.buf.format { async = true }
        end)
        map("<leader>da", dap.toggle_breakpoint)
        map("<leader>dc", dap.continue)
        map("<leader>ds", dap.step_into)
    end
})

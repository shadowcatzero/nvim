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

    map('<leader>wa', vim.lsp.buf.add_workspace_folder)
    map('<leader>wr', vim.lsp.buf.remove_workspace_folder)
    map('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
    map('<leader>D', vim.lsp.buf.type_definition)
    map('<leader>rn', vim.lsp.buf.rename)
    map('<leader>ca', vim.lsp.buf.code_action)
    map('<leader>fm', function()
        vim.lsp.buf.format { async = true }
    end)
end

local capabilities = require 'cmp_nvim_lsp'.default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

return {
    on_attach = on_attach,
    capabilities = capabilities
}

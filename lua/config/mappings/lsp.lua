return function(bufnr)
    local map = function(from, to)
        vim.keymap.set('n', from, to, { noremap = true, silent = true, buffer = bufnr })
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

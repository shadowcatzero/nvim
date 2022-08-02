local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.o.signcolumn = 'yes'
    require 'config.mappings.lsp' (bufnr)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require 'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
}

require 'rust-tools'.setup {
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
}

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
require'lspconfig'.denols.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}


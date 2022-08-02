-- color scheme
vim.g.onedark_config = { style = 'darker' }
vim.cmd('colorscheme onedark')

-- highlight extra white space with red
vim.api.nvim_set_hl(0, 'TrailingWhitespace', { ctermbg = 'red', bg = '#ff5555' })
vim.cmd([[match TrailingWhitespace /\s\+$/]])

-- diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = { prefix = '●' };
})


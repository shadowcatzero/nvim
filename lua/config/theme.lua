local hl = function(name, opts)
    vim.api.nvim_set_hl(0, name, opts)
end
local gbhl = function(name, color)
    hl(name, { bg = color })
end

-- highlight extra white space with red
hl('ExtraWhitespace', { ctermbg = 'red', bg = '#ff8888' })
vim.cmd [[match ExtraWhitespace /\s\+$/]]

-- make background transparent
gbhl('Normal', 'none')
gbhl('EndOfBuffer', 'none')
gbhl('SignColumn', 'none')


local o = vim.o
local g = vim.g

-- basic stuff
o.number = true
o.relativenumber = true
o.showmode = false
o.clipboard = 'unnamedplus'

g.mapleader = ' '
vim.cmd('filetype plugin on')
vim.cmd('syntax on')

-- line break (wrapping) settings
o.linebreak = true
o.breakindent = true
o.showbreak = '\\ '

-- lines after end of file empty instead of ~ (fillchars)
o.fcs = 'eob: '

-- tab
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4

-- turn of gui colors if in tty
if os.getenv('TERM') ~= 'linux' then
    o.termguicolors = true
else
    o.termguicolors = false
end

-- diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = { prefix = '●' };
})


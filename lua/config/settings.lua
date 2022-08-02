local u = require 'config.utils'
local o = vim.o

-- basic stuff
o.number = true
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
o.cmdheight = 2
vim.g.mapleader = ' '

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

-- terminal
u.map('t', '<esc>', '<C-\\><C-n>')
u.nmap('<space>tm', '<cmd>belowright 7sp<cr>:term<cr>A')

-- off search highlight when escape is pressed
u.nmap('<esc>', '<cmd>noh<cr><esc>')

-- colemak
local l = u.layout
l.swap('n', 'h')
l.swap('e', 'j')
l.swap('i', 'k')
l.swap('o', 'l')

l.swap('<C-w>n', '<C-w>h')
l.swap('<C-w>e', '<C-w>j')
l.swap('<C-w>i', '<C-w>k')
l.swap('<C-w>o', '<C-w>l')

l.swap('N', 'H')
l.swap('O', 'L')


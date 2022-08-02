-- basic stuff
vim.o.number = true
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
vim.o.cmdheight = 2
vim.g.mapleader = ' '

-- line break (wrapping) settings
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = '\\ '

-- lines after end of file empty instead of ~ (fillchars)
vim.o.fcs = 'eob: '

-- tab
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- turn of gui colors if in tty
if os.getenv('TERM') ~= 'linux' then
    vim.o.termguicolors = true
else
    vim.o.termguicolors = false
end


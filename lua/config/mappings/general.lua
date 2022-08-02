local opts = { noremap = true, silent = true }

local map = vim.keymap.set
local nmap = function(from, to) map('n', from, to, opts) end
local cmd = function(content) return '<cmd>' .. content .. '<cr>' end

-- terminal
map('t', '<esc>', '<C-\\><C-n>', opts)
nmap('<space>tm', ':belowright 7sp<cr>:term<cr>A')

-- off search highlight when escape is pressed
nmap('<esc>', ':noh<cr><esc>')

-- telescope
nmap('<space>ff', cmd('Telescope find_files'))
nmap('<space>fg', cmd('Telescope live_grep'))
nmap('<space>fb', cmd('Telescope buffers'))
nmap('<space>fh', cmd('Telescope help_tags'))

-- explorer
nmap('<space>e', cmd('Neotree toggle'))

-- lsp (universal)
nmap('E', vim.diagnostic.open_float)
nmap('[d', vim.diagnostic.goto_prev)
nmap(']d', vim.diagnostic.goto_next)
nmap('<space>q', vim.diagnostic.setloclist)


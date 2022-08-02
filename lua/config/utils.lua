local opts = { noremap = true, silent = true }

local utils = {}
utils.map = function(mode, from, to) vim.keymap.set(mode, from, to, opts) end
utils.nmap = function(from, to) vim.keymap.set('n', from, to, opts) end
utils.cmd = function(content) return '<cmd>' .. content .. '<cr>' end

local layout = {}
layout.map = function(from, to)
    vim.keymap.set('n', from, to, opts)
    vim.keymap.set('x', from, to, opts)
end
layout.swap = function(a, b)
    utils.layout.map(a, b)
    utils.layout.map(b, a)
end
utils.layout = layout

return utils


local map = function(from, to)
    vim.keymap.set('n', from, to, { noremap = true, silent = true })
    vim.keymap.set('x', from, to, { noremap = true, silent = true })
end

local swap = function(a, b)
    map(a, b)
    map(b, a)
end

swap('n', 'h')
swap('e', 'j')
swap('i', 'k')
swap('o', 'l')

swap('<C-w>n', '<C-w>h')
swap('<C-w>e', '<C-w>j')
swap('<C-w>i', '<C-w>k')
swap('<C-w>o', '<C-w>l')

swap('N', 'H')
swap('O', 'L')

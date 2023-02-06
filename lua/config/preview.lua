local u = require 'config.utils'

local g = vim.api.nvim_create_augroup('preview', {})

vim.api.nvim_create_autocmd('BufWritePost', {
    group = g,
    pattern = '*.tex',
    callback = function(arg)
        local dir = arg.file:match('.*/')
        local args = ''
        if dir ~= nil then
            args = '-output-directory=\''..dir..'\' '
        end
        vim.cmd('silent exec "!pdflatex '..args..'\''..arg.file..'\'"')
    end
})


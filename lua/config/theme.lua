-- highlight extra white space with red
vim.api.nvim_set_hl(0, 'ExtraWhitespace', { ctermbg = 'red', bg = '#ff8888' })
vim.cmd [[match ExtraWhitespace /\s\+$/]]
print("hello???")


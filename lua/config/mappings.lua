local u = require "config.utils"

-- terminal
local m = u.mapping
m.map("t", "<esc>", "<C-\\><C-n>")
m.map("t", "<C-n>", "<C-\\><C-n><C-w>h")
m.map("t", "<C-e>", "<C-\\><C-n><C-w>j")
m.map("t", "<C-i>", "<C-\\><C-n><C-w>k")
m.map("t", "<C-o>", "<C-\\><C-n><C-w>l")
m.nmap("<leader>tm", "<cmd>belowright 7sp<cr><cmd>term<cr><cmd>setlocal nonu<cr>A")

-- off search highlight when escape is pressed
m.nmap("<esc>", "<cmd>noh<cr><esc>")

-- spell checking
m.cmd("<leader>spl", "setlocal spell spelllang=en_us")
m.cmd("<leader>spL", "setlocal nospell")

-- lsp
m.nmap("E", vim.diagnostic.open_float)
m.nmap("[d", vim.diagnostic.goto_prev)
m.nmap("]d", vim.diagnostic.goto_next)
m.nmap("<leader>q", vim.diagnostic.setloclist)

-- colemak-dh
local l = u.layout
l.swap("n", "h")
l.swap("e", "j")
l.swap("i", "k")
l.swap("o", "l")
l.map("e","gj")
l.map("i","gk")

l.swap("<C-w>n", "<C-w>h")
l.swap("<C-w>e", "<C-w>j")
l.swap("<C-w>i", "<C-w>k")
l.swap("<C-w>o", "<C-w>l")
l.swap("<C-w>N", "<C-w>H")
l.swap("<C-w>E", "<C-w>J")
l.swap("<C-w>I", "<C-w>K")
l.swap("<C-w>O", "<C-w>L")

l.swap("N", "H")
l.swap("O", "L")

l.map("<C-n>", "<C-w>h")
l.map("<C-e>", "<C-w>j")
l.map("<C-i>", "<C-w>k")
l.map("<C-o>", "<C-w>l")

l.map("<C-,>", "<cmd>vert res -1<CR>")
l.map("<C-.>", "<cmd>vert res +1<CR>")

-- ascension
m.map("x","<leader>p", "\"_dp")


local u = require "config.utils"

-- colemak-dh
local h = "n"
local j = "e"
local k = "i"
local l = "o"

local m = u.mapping

-- terminal
m.map("t", "<esc>", "<C-\\><C-n>")
m.map("t", "<tab>", "<tab>")
m.map("t", "<C-"..h..">", "<C-\\><C-n><C-w>h")
m.map("t", "<C-"..j..">", "<C-\\><C-n><C-w>j")
m.map("t", "<C-"..k..">", "<C-\\><C-n><C-w>k")
m.map("t", "<C-"..l..">", "<C-\\><C-n><C-w>l")
m.nmap("<leader>tm", m.fcmds({
    "belowright 7sp",
    "term",
    "setlocal nonu",
    "setlocal scl=no"
}))
m.nmap("<leader>tn", m.fcmds({
    "term",
    "setlocal nonu",
    "setlocal scl=no"
}).."A")

-- move window to new tab
m.nmap("<leader>tt", "<C-W><S-T>")

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

-- "alt tab"
m.nmap("<leader>n", "<C-6>")

-- layout stuff
local lo = u.layout
lo.swap(h, "h")
lo.swap(j, "j")
lo.swap(k, "k")
lo.swap(l, "l")
lo.map(j,"gj")
lo.map(k,"gk")

lo.swap(h:upper(), "H")
lo.swap(l:upper(), "L")

-- moving between windows
lo.map("<C-"..h..">", "<C-w>h")
lo.map("<C-"..j..">", "<C-w>j")
lo.map("<C-"..k..">", "<C-w>k")
lo.map("<C-"..l..">", "<C-w>l")

-- window resizing
lo.cmd("<C-,>", "res -1")
lo.cmd("<C-.>", "res +1")

-- ascension (paste without replacing clipboard)
m.map("x","<leader>p", "\"_dhp")

-- keep centered while moving around
m.nmap("<C-u>", "<C-u>zz")
m.nmap("<C-d>", "<C-d>zz")
m.map({'n', 'o'}, "'", "`")
m.map({'n', 'o'}, "`", "'")


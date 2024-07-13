local o = vim.o
local g = vim.g

-- basic stuff
o.number = true
o.showmode = false
o.clipboard = "unnamedplus"
o.undofile = true

g.mapleader = " "
g.maplocalleader = ","
vim.cmd("filetype plugin on")
vim.cmd("syntax on")
o.guifont = "Comic\\ Code\\ Ligatures"

-- line break (wrapping) settings
o.linebreak = true
o.breakindent = true
o.showbreak = "\\ "

-- lines after end of file empty instead of ~ (fillchars)
o.fcs = "eob: "

-- tab
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4

-- turn of gui colors if in tty
if os.getenv("TERM") ~= "linux" then
    o.termguicolors = true
else
    o.termguicolors = false
end

-- diagnostics
local sev = vim.diagnostic.severity
local text = {
    [sev.ERROR] = " ",
    [sev.WARN] = " ",
    [sev.HINT] = "",
    [sev.INFO] = " ",
}
local hl = {
    [sev.ERROR] = "DiagnosticSignError",
    [sev.WARN] = "DiagnosticSignWarn",
    [sev.HINT] = "DiagnosticSignHint",
    [sev.INFO] = "DiagnosticSignInfo",
}
vim.diagnostic.config({
    virtual_text = { prefix = "●" },
    signs = {
        text = text,
        numhl = hl,
    },
})

-- neovide
if vim.g.neovide then
    vim.g.transparency = 0.8
    vim.g.neovide_transparency = 0.8
    vim.g.neovide_background_color = "#1e1e2a"
end

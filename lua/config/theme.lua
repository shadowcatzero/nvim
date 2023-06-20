local hl = function(name, opts)
    vim.api.nvim_set_hl(0, name, opts)
end
local gbhl = function(name, color)
    hl(name, { bg = color })
end

-- highlight extra white space with red
hl("ExtraWhitespace", { ctermbg = "red", bg = "#ff8888" })
vim.cmd [[match ExtraWhitespace /\s\+$/]]

-- make background partially transparent

-- local bg =  "#1e1e2e"
-- local bg2 =  "#181825"

-- gbhl("Normal", "none")
-- gbhl("NormalNC", "none")
-- gbhl("MsgArea", bg)
-- gbhl("NeoTreeNormal", bg)
-- gbhl("NeoTreeNormalNC", bg)
-- hl("VertSplit", { bg = bg2, fg = bg2 })


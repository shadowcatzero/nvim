local hl = function(name, opts)
    vim.api.nvim_set_hl(0, name, opts)
end
local gbhl = function(name, color)
    hl(name, { bg = color })
end

-- highlight extra white space with red
hl("ExtraWhitespace", { ctermbg = "red", bg = "#ff8888" })
vim.cmd [[match ExtraWhitespace /\s\+$/]]

local bg =  "#201918"

-- make background transparent
-- gbhl("Normal", "none")
-- gbhl("EndOfBuffer", "none")
-- gbhl("SignColumn", "none")
-- gbhl("NeoTreeEndOfBuffer", "none")

--[=[
for _, name in ipairs({
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "MsgArea",
    "lualine_a_command",
    "lualine_a_inactive",
    "lualine_b_inactive",
    "lualine_c_inactive",
}) do gbhl(name, bg) end
]=]--

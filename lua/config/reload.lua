local u = require "config.utils".load

local g = vim.api.nvim_create_augroup("reload", {})

-- reload these files when written to

for _, mod in ipairs({
    "reload",
    "settings",
    "mappings",
    "utils",
    "theme",
}) do u.mod_post_write(g, "config." .. mod, u.reload) end

local group = vim.api.nvim_create_augroup("reload", {})

local post_write = function(path, cmd)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = group,
        pattern = "**/lua/bryan/" .. path,
        command = cmd,
    })
end

for _, path in ipairs({
    "general.lua",
    "theme.lua",
    "mappings/*.lua",
    "neovide.lua",
}) do post_write(path, "source <afile>") end

-- allows you to install and clean plugins after writing to the file
post_write("plugins/plugins.lua", "source <afile> | PackerCompile")


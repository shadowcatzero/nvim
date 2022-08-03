local group = vim.api.nvim_create_augroup('reload', {})

local post_write = function(path, fn)
    vim.api.nvim_create_autocmd('BufWritePost', {
        group = group,
        pattern = '**/lua/config/' .. path,
        callback = fn,
    })
end

for _, path in ipairs({
    'reload.lua',
    'settings.lua',
    'utils.lua',
    'neovide.lua',
    'theme.lua',
}) do post_write(path, function(arg) dofile(arg.file) end) end

-- allows you to install / clean / update plugins
-- after writing to the file

---
--- @param arg {file: string}
local update_plugins = function(arg)
    -- unload the file if it's not plugins.lua
    local i = arg.file:find("config/plugins/")
    if i ~= nil then
        local mod = arg.file:sub(i):gsub("/", "."):sub(0, -5)
        package.loaded[mod] = nil
    end
    -- reload plugins.lua and compile
    package.loaded['config.plugins'] = nil
    require 'config.plugins'
    require 'packer'.compile()
end

post_write('plugins.lua', update_plugins)
post_write('plugins/*', update_plugins)


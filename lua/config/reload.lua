local u = require 'config.utils'.load

local g
vim.api.nvim_create_augroup('reload', {})

-- reload these files when written to

--- @param arg {file: string}
local reload_file = function(arg)
    u.reload(u.path_for(arg.file))
end

for _, path in ipairs({
    'reload.lua',
    'settings.lua',
    'utils.lua',
    'neovide.lua',
    'theme.lua',
}) do u.post_write(g, path, reload_file) end

-- allows you to install / clean / update plugins
-- after writing to the file

---
--- @param arg {file: string}
local update_plugins = function(arg)
    -- unload the file if it's not plugins.lua
    local mod = u.path_for(arg.file)
    if mod ~= 'config.plugins' then
        u.unload(mod)
    end
    -- reload plugins.lua and compile
    u.reload('config.plugins')
    require 'packer'.compile()
end

u.post_write(g, 'plugins.lua', update_plugins)
u.post_write(g, 'plugins/*', update_plugins)

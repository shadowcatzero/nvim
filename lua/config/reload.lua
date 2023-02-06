local u = require 'config.utils'.load

local g = vim.api.nvim_create_augroup('reload', {})

-- reload these files when written to

for _, mod in ipairs({
    'reload',
    'settings',
    'mappings',
    'utils',
    'neovide',
    'theme',
    'preview',
}) do u.mod_post_write(g, 'config.' .. mod, u.reload) end

-- reload plugin files when written to

u.mod_post_write(g, 'config.plugins', function(mod)
    u.reload(mod)
    require 'packer'.compile()
end)
u.mod_post_write(g, 'config.plugins.*', function(mod)
    print(mod)
    u.unload(mod)
    u.reload('config.plugins')
    require 'packer'.compile()
end)

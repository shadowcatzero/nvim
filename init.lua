for _, name in ipairs({
    'reload',
    'settings',
    'plugins',
    'neovide',
    'theme'
}) do require('config.' .. name) end

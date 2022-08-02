for _, name in ipairs({
    'reload',
    'settings',
    'plugins',
}) do require('config.' .. name) end

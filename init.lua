for _, name in ipairs({
    'mappings.colemak',
    'reload',
    'general',
    'plugins',
    'mappings.general',
    'theme',
}) do require('config.' .. name) end

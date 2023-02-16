for _, name in ipairs({
    "reload",
    "settings",
    "mappings",
    "plugins",
    "neovide",
    "theme",
    "preview"
}) do require("config." .. name) end

for _, name in ipairs({
    "reload",
    "settings",
    "mappings",
    "plugins",
    "theme",
    "preview"
}) do require("config." .. name) end

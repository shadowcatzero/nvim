for _, name in ipairs({
    "reload",
    "settings",
    "mappings",
    "plugins",
    "theme",
}) do require("config." .. name) end

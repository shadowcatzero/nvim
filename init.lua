for _, name in ipairs({
    "reload",
    "settings",
    "mappings",
    "plugins",
    "theme",
    "filetype",
}) do require("config." .. name) end

local opts = { noremap = true, silent = true }

-- mapping
local mapping = {}
mapping.map = function(mode, from, to) vim.keymap.set(mode, from, to, opts) end
mapping.nmap = function(from, to) vim.keymap.set('n', from, to, opts) end
mapping.cmd = function(content) return '<cmd>' .. content .. '<cr>' end

-- layout (mapping)
local layout = {}
layout.map = function(from, to)
    vim.keymap.set('n', from, to, opts)
    vim.keymap.set('x', from, to, opts)
end
layout.swap = function(a, b)
    layout.map(a, b)
    layout.map(b, a)
end
mapping.layout = layout

-- loading stuff
local load = {}
load.post_write = function(group, path, fn)
    vim.api.nvim_create_autocmd('BufWritePost', {
        group = group,
        pattern = '**/lua/config/' .. path,
        callback = fn,
    })
end

load.unload = function(mod) package.loaded[mod] = nil end
load.reload = function(mod) load.unload(mod) require(mod) end
--- @param path string
load.path_for = function(path)
    local i = path:find("lua/config/")
    if i == nil then return nil end
    local mod = path:sub(i + 4):gsub("/", "."):sub(0, -5)
    return mod
end

return {
    mapping = mapping,
    layout = layout,
    load = load,
}

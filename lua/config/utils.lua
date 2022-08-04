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
load.lua_path = vim.fn.stdpath('config') .. '/lua/'

load.post_write = function(group, path, fn)
    vim.api.nvim_create_autocmd('BufWritePost', {
        group = group,
        pattern = load.lua_path .. path,
        callback = fn,
    })
end
load.mod_post_write = function(group, mod, fn)
    local set_name = false
    if mod:sub(-1, -1) == '*' then set_name = true end
    local path = mod:gsub('[.]', '/') .. '.lua'
    load.post_write(group, path, function(arg)
        local m = mod
        if set_name then
            local name = arg.file:match('.*/(.*).lua')
            m = mod:sub(0, -2) .. name
        end
        fn(m, arg)
    end)
end

load.unload = function(mod) package.loaded[mod] = nil end
load.reload = function(mod) load.unload(mod) require(mod) end

return {
    mapping = mapping,
    layout = layout,
    load = load,
}

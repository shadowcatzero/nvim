local u = require 'config.utils'

vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]
require 'neo-tree'.setup {
    filesystem = {
        filtered_items = {
            visible = true,
        }
    },
    window = {
        width = 30,
    },
}
u.nmap('<space>e', u.cmd('Neotree toggle'))

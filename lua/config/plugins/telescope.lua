local u = require 'config.utils'

require 'telescope'.setup {}

u.nmap('<space>ff', u.cmd('Telescope find_files'))
u.nmap('<space>fg', u.cmd('Telescope live_grep'))
u.nmap('<space>fb', u.cmd('Telescope buffers'))
u.nmap('<space>fh', u.cmd('Telescope help_tags'))


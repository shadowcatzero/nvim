local fn = vim.fn

-- bootstrap
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

local packer = require('packer')
packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- plugin categories
    require 'config.plugins.telescope'(use)
    require 'config.plugins.tree'(use)
    require 'config.plugins.syntax'(use)
    require 'config.plugins.cmp'(use)
    require 'config.plugins.lsp'(use)
    require 'config.plugins.visual'(use)

    -- sync if bootstrapped
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)

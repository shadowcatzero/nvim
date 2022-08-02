local packer = require('packer')
packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    -- files
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
    use 'nvim-telescope/telescope-ui-select.nvim'
    use { 'nvim-neo-tree/neo-tree.nvim', branch = "v2.x", }
    use 'MunifTanjim/nui.nvim'
    -- syntax highlighting
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- autocomplete / snippits
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    -- auto pairs
    use 'windwp/nvim-autopairs'
    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
    use 'mfussenegger/nvim-dap'
    use 'nvim-lua/completion-nvim'
    use 'tjdevries/nlua.nvim'
    -- visual
    use 'kyazdani42/nvim-web-devicons'
    use 'navarasu/onedark.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'lewis6991/gitsigns.nvim'
end)

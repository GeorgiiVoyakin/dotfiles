return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Tokyonight colorscheme
    use 'folke/tokyonight.nvim'
    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- Collection of configurations for the built-in LSP client
    use 'neovim/nvim-lspconfig'
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- Telescope extension for better and faster sorting
    -- Devicons
    use 'kyazdani42/nvim-web-devicons'
    -- Autocomplete
    use 'hrsh7th/nvim-cmp' -- Completion engine
    use 'hrsh7th/cmp-nvim-lsp' -- Source for neovim's built-in language server client
    use 'hrsh7th/cmp-buffer' -- Source for current buffer
    use 'hrsh7th/cmp-path' -- Source for filesystem paths
    use 'L3MON4D3/LuaSnip' -- Snippet engine
    use 'saadparwaiz1/cmp_luasnip' -- Luasnip completion source for nvim-cmp
end)

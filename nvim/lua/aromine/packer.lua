-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Copilot
    use 'github/copilot.vim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use({
        'marko-cerovac/material.nvim',
        as = 'material.nvim',
        config = function()
            vim.g.material_style = 'darker'
            vim.cmd 'colorscheme material'
        end
    })

    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use ('mbbill/undotree')

    -- Show folders like IDE
    use ('nvim-tree/nvim-tree.lua', {run = 'NvimTreeToggle'})
    use ('nvim-tree/nvim-web-devicons')

    -- Show Git Changes
    use ('lewis6991/gitsigns.nvim')

    -- Use hjkl to switch between open vims in tmux
    use ('christoomey/vim-tmux-navigator')

    -- Make helpful bar pop up
    use ('vim-airline/vim-airline')
    use ('vim-airline/vim-airline-themes')

    -- Easy comments
    use ('scrooloose/nerdcommenter')

    -- Close pairs
    use ('cohama/lexima.vim')

    -- File movement
    use ('ggandor/leap.nvim')
    use ('ggandor/flit.nvim')

    -- Troubleshooting
    use ('folke/trouble.nvim')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required

            -- Snippets
            {'saadparwaiz1/cmp_luasnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

end)

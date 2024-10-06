return {
    -- Completion and Snippets
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                        return
                    end
                    return 'make install_jsregexp'
                end)(),
                dependencies = {
                    {
                        'rafamadriz/friendly-snippets',
                        config = function()
                            require('luasnip.loaders.from_vscode').lazy_load()
                        end,
                    },
                },
            },
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
        },
        config = function()
            require('configs.cmp')
        end,
    },

    -- LSP Configuration and Management
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            { 'j-hui/fidget.nvim',       opts = {} },
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            require('configs.lsp')
        end,
        event = { "BufReadPre", "BufNewFile" },
    },

    -- File Explorer and Bufferline
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'moll/vim-bbye',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('configs.bufferline')
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("configs.nvimtree")
        end,
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        keys = {
            { "<leader>b", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
            { "<leader>e", "<cmd>NvimTreeFocus<CR>",  desc = "Focus NvimTree window" },
        }
    },

    -- Git Integration and Todo Comments
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("configs.gitsigns")
        end,
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },

    -- UI Customization (Indent, Colorizer, Autopairs)
    "nvim-lua/plenary.nvim",

    {
        "nvchad/base46",
        build = function()
            require("base46").load_all_highlights()
        end,
        priority = 1000,
    },

    {
        "nvchad/ui",
        lazy = false,
        config = function()
            require "nvchad"
        end,
        priority = 999,
    },

    "nvchad/volt",
    "nvchad/minty",
    "nvchad/menu",

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            indent = { char = '▏' },
            scope = {
                show_start = false,
                show_end = false,
                show_exact_scope = false,
            },
            exclude = {
                filetypes = {
                    'help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'Trouble',
                },
            },
        },
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
    },

    -- Miscellaneous Plugins (Keybinding Helpers, Fuzzy Finder, Commandline Enhancements)
    'folke/which-key.nvim',
    {
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        branch = '0.1.x',
        dependencies = {
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        config = function()
            require('configs.telescope')
        end,
    },
    {
        'VonHeikemen/fine-cmdline.nvim',
        dependencies = { 'MunifTanjim/nui.nvim' },
    },

    -- Syntax Highlighting (Treesitter)
    {
        'nvim-treesitter/nvim-treesitter',
        event = "BufRead",
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        config = function()
            require('configs.treesitter')
        end,
    },

    -- Shared Dependencies
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    -- Code formatters
    {
        "stevearc/conform.nvim",
        config = function()
            require("configs.conform")
        end,
    },
}

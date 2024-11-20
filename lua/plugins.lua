return {
	-- UI Enhanced Plugins
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
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
			require("nvchad")
		end,
		priority = 999,
	},
	"nvchad/volt",
	"nvchad/minty",
	"nvchad/menu",
	"DaikyXendo/nvim-material-icon",
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			indent = { char = "│", highlight = "IblChar" },
			scope = { char = "│", highlight = "IblScopeChar" },
		},
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "blankline")

			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
			require("ibl").setup(opts)

			dofile(vim.g.base46_cache .. "blankline")
		end,
	},

	-- Necessary Utils
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		opts = function()
			return require("configs.nvimtree")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		opts = function()
			return require("configs.telescope")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "User FilePost",
		opts = function()
			return require("configs.gitsigns")
		end,
	},

	-- LSP
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = function()
			return require("configs.mason")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("configs.lspconfig").setup()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					require("configs.luasnip")
				end,
			},
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require("configs.cmp")
		end,
	},

	-- Unnecessary Utils, but I like using it
	{
		"stevearc/conform.nvim",
		event = "BufReadPre",
		config = function()
			require("configs.conform")
		end,
	},
	{
		"folke/which-key.nvim",
		cmd = { "WhichKey" },
	},
	{
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		cmd = { "FineCmdline" },
	},
	{
		"utilyre/barbecue.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "SmiteshP/nvim-navic" },
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = { signs = false },
	},
}

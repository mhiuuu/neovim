dofile(vim.g.base46_cache .. "telescope")
local file_ignore_patterns = {
	"node_modules/",
	"dist/",
	"%.next",
	"%.git/",
	"%.gitlab/",
	"build/",
	"target/",
}
return {
	defaults = {
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = " ",
		sorting_strategy = "ascending",
		file_ignore_patterns = file_ignore_patterns,
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
			},
			width = 0.87,
			height = 0.80,
		},
		mappings = {
			n = { ["q"] = require("telescope.actions").close },
		},
	},

	extensions_list = { "themes", "terms" },
	extensions = {},
}

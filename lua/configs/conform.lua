local M = {}

M.setup = function()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "autopep8" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			c = { "clang-format" },
			cpp = { "clang-format" },
			css = { "prettier" },
			java = { "google-java-format" },
			html = { "prettier" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})
end
return M.setup()

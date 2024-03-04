-- file formatting

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>ff",
			function()
				require("conform").format()
			end,
			desc = "File Format",
		},
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				cpp = { "clang_format" },
				lua = { "stylua" },
				python = { "isort", "black" },
				shell = { "shfmt", "shellcheck" },
				fish = { "fish_indent" },
				-- Use the "*" filetype to run formatters on all filetypes.
				["*"] = { "codespell" },
				-- Use the "_" filetype to run formatters on filetypes that don't
				-- have other formatters configured.
				["_"] = { "trim_whitespace" },
			},
			formatters = {
				black = {
					prepend_args = "--fast",
				},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}

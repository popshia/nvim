-- file formatting

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	keys = {
		{
			"<leader>ff",
			function()
				require("conform").format()
			end,
			desc = "File Format",
		},
	},
	opts = {
		formatters_by_ft = {
			cpp = { "clang_format" },
			lua = { "stylua" },
			python = { "isort", "black" },
			shell = { "shfmt", "shellcheck" },
			fish = { "fish_indent" },
			json = { "jq" },
			-- Use the "*" filetype to run formatters on all filetypes.
			["*"] = { "trim_whitespace", "codespell" },
			-- Use the "_" filetype to run formatters on filetypes that don't
			-- have other formatters configured.
			["_"] = {},
		},
		formatters = {
			black = {
				prepend_args = { "--fast" },
			},
			clang_foramt = {
				prepend_args = { "--style=LLVM" },
			},
			isort = {
				prepend_args = { "--profile", "black" },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}

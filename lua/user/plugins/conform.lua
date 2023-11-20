local M = {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
}

function M.config()
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
end

return M

-- null-ls
-- local M = {
-- 	"nvimtools/none-ls.nvim",
-- }
--
-- function M.config()
-- 	local null_ls = require("null-ls")
--
-- 	local formatting = null_ls.builtins.formatting
-- 	local diagnostics = null_ls.builtins.diagnostics
-- 	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- 	null_ls.setup({
-- 		sources = {
-- 			-- formatting.stylua,
-- 			formatting.black.with({ extra_args = { "--fast" } }),
-- 			formatting.isort,
-- 			formatting.shfmt,
-- 			formatting.clang_format,
-- 			diagnostics.shellcheck,
-- 			null_ls.builtins.completion.spell,
-- 		},
-- 		on_attach = function(client, bufnr)
-- 			if client.supports_method("textDocument/formatting") then
-- 				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
-- 				vim.api.nvim_create_autocmd("BufWritePre", {
-- 					group = augroup,
-- 					buffer = bufnr,
-- 					callback = function()
-- 						vim.lsp.buf.format({ async = false })
-- 					end,
-- 				})
-- 			end
-- 		end,
-- 	})
-- end

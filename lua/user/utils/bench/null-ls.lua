-- easy to use formatter, diagnostics and completions

local M = {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
}

M.formatter = {
	"black",
	-- "clang-format",
	"isort",
	"shfmt",
	"stylua",
}

function M.config()
	require("mason-null-ls").setup({
		ensure_installed = M.formatter,
	})

	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local completion = null_ls.builtins.completion
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		-- appple
		sources = {
			formatting.stylua,
			formatting.isort,
			formatting.black.with({ extra_args = { "--fast" } }),
			formatting.shfmt,
			-- formatting.clangd,
			-- diagnostics.codespell,
			-- diagnostics.shellcheck,
			-- completion.spell,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end
		end,
	})
end

return M

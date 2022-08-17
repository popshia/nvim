local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
-- local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		-- python
		-- diagnostics.flake8,
		formatting.black,
		formatting.isort,

		-- c, c++
		-- formatting.clang_format,

		-- other languages
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
	},

	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync({ async = true })")
		end
	end,
})

local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
-- local completion = null_ls.builtins.completion
-- local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		-- lua
		formatting.stylua,

		-- python
		formatting.black,
		formatting.isort,
		-- formatting.autopep8,
		-- formatting.YAPF,

		-- c, c++
		formatting.clang_format,

		-- code spelling
		formatting.codespell,

		-- other languages
		-- formatting.eslint_d,
		-- formatting.prettier,
		-- formatting.json_tool,
	},

	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})

-- lsp, dap, linter, formatter manager

local M = {
	"williamboman/mason-lspconfig.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"williamboman/mason.nvim",
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
}

M.lsp_servers = {
	-- "clangd",
	"pyright",
	"lua_ls",
	"bashls",
}

M.formatter = {
	"black",
	-- "clang-format",
	"isort",
	"shfmt",
	"stylua",
}

function M.config()
	require("mason").setup({
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
	require("mason-lspconfig").setup({
		ensure_installed = M.lsp_servers,
		automatic_installation = true,
	})
	require("mason-null-ls").setup({
		ensure_installed = M.formatter,
	})
end

return M

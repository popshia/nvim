local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"nvim-lua/plenary.nvim",
	},
}

M.servers = {
	"clangd",
	"clang-format",
	"pyright",
	"isort",
	"black",
	"lua_ls",
	"bashls",
	"shellcheck",
	"shfmt",
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
		ensure_installed = M.servers,
		automatic_installation = true,
	})
end

return M

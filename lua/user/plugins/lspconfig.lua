-- lsp keymaps and on_attach function and all other configs

local M = {
	"neovim/nvim-lspconfig",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"folke/neodev.nvim",
	},
}

local function lsp_keymaps(bufnr)
	local map = function(key, func)
		vim.api.nvim_buf_set_keymap(bufnr, "n", key, func, { noremap = true, silent = true })
	end
	-- nvim builtin
	-- map("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	-- map("gR", "<cmd>lua vim.lsp.buf.references()<CR>")
	-- map("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	-- map("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	-- trouble.nvim
	map("gd", "<cmd>Trouble lsp_definitions<CR>")
	map("gR", "<cmd>Trouble lsp_references<CR>")
	map("gi", "<cmd>Trouble lsp_implementations<CR>")
	map("gD", "<cmd>Trouble document_diagnostics<CR>")
	map("gw", "<cmd>Trouble workspace_diagnostics<CR>")
	map("gr", "<cmd>lua vim.lsp.buf.rename()<CR>")
	map("gk", "<cmd>lua vim.lsp.buf.hover()<CR>")
	map("gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	map("gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
	map("[d", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>")
	map("]d", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>")
end

local function lsp_global_keymaps()
	map("n", "<leader>lm", "<cmd>Mason<cr>", "Mason")
	map("n", "<leader>li", "<cmd>LspInfo<cr>", "LSP Info")
	map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = false })<cr>", "Format")
	map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols theme=ivy<cr>", "Document symbols")
	map("n", "<leader>lS", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help")
	map("n", "<leader>ld", "<cmd>Neogen<CR>", "Generate Docstring")
	map("n", "<leader>lp", "<cmd>lua vim.diagnostic.goto_prev({ buffer=0 })<CR>", "Previous Diagnostic")
	map("n", "<leader>ln", "<cmd>lua vim.diagnostic.goto_next({ buffer=0 })<CR>", "Next Diagnostic")
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_global_keymaps()

	-- disable some lsp's formatter
	if client.name == "clangd" or client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end
end

function M.common_capabilities()
	local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if status_ok then
		return cmp_nvim_lsp.default_capabilities()
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}

	return capabilities
end

function M.config()
	local lspconfig = require("lspconfig")
	local icons = require("user.utils.icons")

	local servers = {
		"clangd",
		"lua_ls",
		"pyright",
		"bashls",
	}

	local default_diagnostic_config = {
		signs = {
			active = true,
			values = {
				{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
				{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
				{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
				{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
			},
		},
		virtual_text = true,
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(default_diagnostic_config)

	for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	require("lspconfig.ui.windows").default_options.border = "rounded"

	for _, server in pairs(servers) do
		local opts = {
			on_attach = M.on_attach,
			capabilities = M.common_capabilities(),
		}

		local require_ok, settings = pcall(require, "user.server-configs" .. server)

		if require_ok then
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		if server == "lua_ls" then
			require("neodev").setup({})
		end

		lspconfig[server].setup(opts)
	end
end

return M

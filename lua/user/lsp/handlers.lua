local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local icons = require("user.icons")
	vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
	vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

	local signs = {
		{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
		{ name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
		{ name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
		{ name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = {
			prefix = "●",
		},
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function attach_navic(client, bufnr)
	vim.g.navic_silence = true
	local navic_ok, navic = pcall(require, "nvim-navic")
	if not navic_ok then
		return
	end
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local map = vim.api.nvim_buf_set_keymap
	map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	map(bufnr, "n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	map(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	map(bufnr, "n", "gk", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- map(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- map(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- map(bufnr, "n", "g[", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	-- map(bufnr, "n", "g]", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	-- map(bufnr, "n", "gq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	-- map(bufnr, "n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	attach_navic(client, bufnr)

	if client.name == "clangd" then
		client.server_capabilities.document_formatting = false
	end

	if client.server_capabilities.documentFormattingProvider then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
	end
end

-- function M.enable_format_on_save()
-- 	vim.cmd([[
--     augroup format_on_save
--       autocmd!
--       autocmd BufWritePre      * lua vim.lsp.buf.format({ async = false })
--     augroup end
-- 	]])
-- 	vim.notify("Enabled format on save")
-- end
--
-- function M.disable_format_on_save()
-- 	M.remove_augroup("format_on_save")
-- 	vim.notify("Disabled format on save")
-- end
--
-- function M.toggle_format_on_save()
-- 	if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
-- 		M.enable_format_on_save()
-- 	else
-- 		M.disable_format_on_save()
-- 	end
-- end
--
-- function M.remove_augroup(name)
-- 	if vim.fn.exists("#" .. name) == 1 then
-- 		vim.cmd("au! " .. name)
-- 	end
-- end
--
-- vim.cmd([[ command! LspToggleAutoFormat execute 'lua require("user.lsp.handlers").toggle_format_on_save()' ]])

return M

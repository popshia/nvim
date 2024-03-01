-- lsp keymaps and on_attach function and all other configs

local M = {
	"neovim/nvim-lspconfig",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		{
			"folke/neodev.nvim",
			ft = "lua",
			opts = {},
		},
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	keys = {
		{ "gd", "<cmd>Trouble lsp_definitions<CR>", desc = "Goto Definition" },
		{ "gr", "<cmd>Trouble lsp_references<CR>", desc = "Goto Reference" },
		{ "gi", "<cmd>Trouble lsp_implementations<CR>", desc = "Goto Implementation" },
		{ "gk", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover Documentation" },
		{ "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open Float" },
		{ "[d", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", desc = "Previous Diagnostic" },
		{ "]d", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", desc = "Next Diagnostics" },
		{ "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
		{ "<leader>td", "<cmd>Trouble lsp_type_definitions<CR>", desc = "Type Definition" },
		{ "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
		{ "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
		{ "<leader>ms", "<cmd>Mason<cr>", desc = "Mason" },
	},
}

function M.config()
	local icons = require("user.utils.icons")
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

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
		callback = function(event)
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			if client and client.server_capabilities.documentHighlightProvider then
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = event.buf,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					callback = vim.lsp.buf.clear_references,
				})
			end
		end,
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

	local servers = {
		clangd = {
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		},
		lua_ls = {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					format = { enable = false },
					diagnostics = {
						globals = { "vim" },
						disable = { "missing-fields" },
					},
					workspace = {
						checkThirdParty = false,
						library = {
							-- [vim.fn.expand("$VIMRUNTIME/lua")] = true,
							-- [vim.fn.stdpath("config") .. "/lua"] = true,
							"${3rd}/luv/library",
							unpack(vim.api.nvim_get_runtime_file("", true)),
						},
					},
					completion = { callSnippet = "Replace" },
					telemetry = { enable = false },
				},
			},
		},
		pyright = {
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "off",
					},
				},
			},
		},
		bashls = {},
	}

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

	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, {
		"black",
		"clang-format",
		"codespell",
		"isort",
		"pyright",
		"shellcheck",
		"shfmt",
		"stylua",
	})

	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	require("mason-lspconfig").setup({
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				-- This handles overriding only values explicitly passed
				-- by the server configuration above. Useful when disabling
				-- certain features of an LSP (for example, turning off formatting for tsserver)
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
		},
		automatic_installation = true,
	})
end

return M

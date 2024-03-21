-- lsp keymaps and other configs
local m = 1

return {
	"neovim/nvim-lspconfig",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		{ "folke/neodev.nvim", ft = "lua", opts = {} },
		{ "j-hui/fidget.nvim", opts = {} },
		{ "ray-x/lsp_signature.nvim", opts = {} },
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
		{ "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
		{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions" },
		{ "<leader>li", "<cmd>LspInfo<CR>", desc = "LSP Info" },
		{ "<leader>ms", "<cmd>Mason<CR>", desc = "Mason" },
		-- { "<leader>td", "<cmd>Trouble lsp_type_definitions<CR>", desc = "Type Definition" },
	},
	config = function()
		local diagnostic_configs = {
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

		vim.diagnostic.config(diagnostic_configs)

		local icons = require("user.utils.icons")
		local signs = {
			Error = icons.diagnostics.BoldError,
			Warn = icons.diagnostics.BoldWarning,
			Hint = icons.diagnostics.BoldHint,
			Info = icons.diagnostics.BoldInformation,
		}

		for type, icon in pairs(signs) do
			local diagnostic_type = "DiagnosticSign" .. type
			vim.fn.sign_define(diagnostic_type, { text = icon, texthl = diagnostic_type, numhl = diagnostic_type })
		end

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
		require("lspconfig.ui.windows").default_options.border = "rounded"

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
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
						},
						completion = { callSnippet = "Replace" },
						telemetry = { enable = false },
					},
				},
			},
			basedpyright = {
				settings = {
					basedpyright = {
						analysis = {
							autoImportCompletions = true,
							typeCheckingMode = "off",
						},
					},
				},
				on_attach = function(bufnr)
					require("lsp_signature").on_attach({
						floating_window = false,
						hint_prefix = icons.diagnostics.BoldInformation .. " ",
					}, bufnr)
				end,
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
			"jq",
			"basedpyright",
			"shellcheck",
			"shfmt",
			"stylua",
		})

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.on_attach = function(bufnr)
						require("lsp_signature").on_attach({
							floating_window = false,
							hint_prefix = icons.diagnostics.BoldInformation .. " ",
						}, bufnr)
					end
					require("lspconfig")[server_name].setup(server)
				end,
			},
			automatic_installation = true,
		})

		require("lspconfig").basedpyright.setup(servers["basedpyright"])
	end,
}

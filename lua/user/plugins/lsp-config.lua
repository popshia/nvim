-- lsp keymaps and other configs

return {
	"neovim/nvim-lspconfig",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
		{ "j-hui/fidget.nvim", opts = {} },
		{ "ray-x/lsp_signature.nvim", opts = {} },
		{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", opts = {} },
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
		{ "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
		{ "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
		{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions" },
		{ "<leader>li", "<cmd>LspInfo<CR>", desc = "LSP Info" },
		{ "<leader>ms", "<cmd>Mason<CR>", desc = "Mason" },
	},
	config = function()
		-- diagnostic configs
		vim.diagnostic.config({
			virtual_text = false,
			update_in_insert = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})

		-- icons configs
		local signs = {
			Error = "",
			Warn = "",
			Hint = "󰌵",
			Info = "",
		}
		for type, icon in pairs(signs) do
			local diagnostic_type = "DiagnosticSign" .. type
			vim.fn.sign_define(diagnostic_type, { text = icon, texthl = diagnostic_type, numhl = diagnostic_type })
		end

		-- lsp configs
		local lsp = vim.lsp
		lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" })
		lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "rounded" })
		require("lspconfig.ui.windows").default_options.border = "rounded"

		-- expand capabilities using cmp_nvim_lsp
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		-- capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

		-- lsp server configs
		local servers = {
			clangd = {
				cmd = { "clangd", "--offset-encoding=utf-16" },
				InlayHints = {
					Designators = true,
					Enabled = true,
					ParameterNames = true,
					DeducedTypes = true,
				},
				fallbackFlags = { "-std=c++20" },
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
						hint = { enable = true },
					},
				},
			},
			basedpyright = {
				settings = {
					basedpyright = {
						disableOrganizeImports = true,
						analysis = {
							autoImportCompletions = true,
							typeCheckingMode = "off",
							diagnosticMode = "openFilesOnly",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			},
			html = {
				filetypes = { "html", "htmldjango" },
			},
			tailwindcss = {},
			bashls = {},
		}

		require("mason").setup({
			ui = {
				border = "rounded",
				icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" },
			},
		})

		local ensure_install_servers = vim.tbl_keys(servers)
		vim.list_extend(ensure_install_servers, {
			"black",
			"clang-format",
			"codespell",
			"djlint",
			"isort",
			"jq",
			"shellcheck",
			"shfmt",
			"stylua",
		})

		require("mason-tool-installer").setup({ ensure_installed = ensure_install_servers })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					---@diagnostic disable-next-line
					server.on_attach = function(client, bufnr)
						require("lsp_signature").on_attach({
							floating_window = false,
							hint_prefix = "󰋼 ",
						}, bufnr)
						if client.server_capabilities.inlayHintProvider then
							vim.lsp.inlay_hint.enable(true)
						end
					end
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
			automatic_installation = true,
		})
	end,
}

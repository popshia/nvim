-- autocompletion plugins

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- cmp sources
		{ "hrsh7th/cmp-buffer" }, -- buffer completions
		{ "hrsh7th/cmp-path" }, -- path completions
		{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
		{ "hrsh7th/cmp-nvim-lsp" }, -- lsp completions
		{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
		{ "windwp/nvim-autopairs" }, -- autopairs completions
		{ "onsails/lspkind-nvim" }, -- vscode like formatting
		-- Snippets
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
	},
	-- event = "InsertEnter",
	config = function()
		local cmp = require("cmp")

		-- cmp-autopair
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- luasnip
		local luasnip = require("luasnip")
		luasnip.config.setup()
		require("luasnip").filetype_extend("html", { "djangohtml" })
		require("luasnip").filetype_extend("htmldjango", { "html" })
		require("luasnip").filetype_extend("python", { "django" })
		require("luasnip/loaders/from_vscode").lazy_load()

		cmp.setup({
			sources = {
				{ name = "lazydev" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol_text", -- show only symbol annotations
					maxwidth = function()
						return math.floor(0.45 * vim.o.columns)
					end,
					ellipsis_char = "...",
					show_labelDetails = true, -- show labelDetails in menu. Disabled by default
					before = require("tailwind-tools.cmp").lspkind_format,
				}),
			},
			view = { docs = { auto_open = true } },
			experimental = { ghost_text = true },
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}

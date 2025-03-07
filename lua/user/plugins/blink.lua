-- autocomplete

return {
	"saghen/blink.cmp",
	lazy = false,
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
	},
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	config = function()
		local source_priority = {
			lsp = 4,
			snippets = 3,
			path = 2,
			buffer = 1,
		}

		require("blink-cmp").setup({
			keymap = { preset = "enter" },
			cmdline = {
				keymap = {
					["<CR>"] = { "accept_and_enter", "fallback" },
				},
				completion = {
					menu = { auto_show = true },
					list = {
						selection = {
							preselect = false,
							auto_insert = true,
						},
					},
				},
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					cmdline = {
						min_keyword_length = function(ctx)
							-- when typing a command, only show when the keyword is 3 characters or longer
							if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
								return 3
							end
							return 0
						end,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},
			signature = { enabled = true },
			completion = {
				keyword = { range = "full" },
				menu = {
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind", gap = 1 },
						},
					},
				},
				documentation = { auto_show = true },
			},
			snippets = {
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
				sorts = {
					function(a, b)
						local a_priority = source_priority[a.source_id]
						local b_priority = source_priority[b.source_id]
						if a_priority ~= b_priority then
							return a_priority > b_priority
						end
					end,
					-- defaults
					"score",
					"sort_text",
				},
			},
		})
	end,
}

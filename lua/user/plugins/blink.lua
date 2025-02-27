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
	opts = {
		keymap = {
			preset = "enter",
		},
		cmdline = {
			keymap = { ["<CR>"] = { "accept_and_enter", "fallback" } },
			completion = {
				menu = { auto_show = true },
			},
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
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
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}

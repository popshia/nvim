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
	version = "v0.*",
	opts = {
		keymap = {
			preset = "enter",
		},
		cmdline = {
			keymap = { ["<CR>"] = { "accept_and_enter", "fallback" } },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		signature = { enabled = true },
		completion = {
			keyword = { range = "full" },
			menu = {
				-- auto_show = function(ctx)
				-- 	return ctx.mode ~= "cmdline"
				-- end,
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
				},
			},
			documentation = {
				auto_show = true,
			},
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
	},
	opts_extend = { "sources.default" },
}

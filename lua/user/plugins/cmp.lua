-- autocompletion plugins

local M = {
	"hrsh7th/nvim-cmp", -- the completion plugin
	dependencies = {
		-- cmp sources
		{
			"hrsh7th/cmp-buffer", -- buffer completions
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-path", -- path completions
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-cmdline", -- cmdline completions
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-nvim-lsp", -- lsp completions
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-nvim-lua", -- lua completions
			event = "InsertEnter",
		},
		{
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			event = "InsertEnter",
		},
		{
			"lukas-reineke/cmp-under-comparator", -- sort completions
			event = "InsertEnter",
		},
		-- Snippets
		{
			"L3MON4D3/LuaSnip", --snippet engine
			event = "InsertEnter",
		},
		{
			"rafamadriz/friendly-snippets", -- a bunch of snippets to use
			event = "InsertEnter",
		},
	},
	event = "InsertEnter",
}

function M.config()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	require("luasnip/loaders/from_vscode").lazy_load()

	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end

	local icons = require("user.utils.icons")
	local kind_icons = icons.kind

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<Up>"] = cmp.mapping.select_prev_item(),
			["<Down>"] = cmp.mapping.select_next_item(),
			["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
			["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),
			["<C-a>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- Accept currently selected item. If none selected, `select` first item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				-- Kind icons
				vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					path = "[Path]",
					buffer = "[Buffer]",
					luasnip = "[Snippet]",
					-- nvim_lua = "[Lua]",
				})[entry.source.name]
				return vim_item
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "buffer" },
			{ name = "luasnip" },
			-- { name = "nvim_lua" },
			-- { name = "cmp_tabnine" },
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		experimental = {
			ghost_text = true,
			-- native_menu = true,
		},
		sorting = {
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				require("cmp-under-comparator").under,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
	})

	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline("/", {
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

	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
		}, {
			{ name = "buffer" },
		}),
	})
end

return M

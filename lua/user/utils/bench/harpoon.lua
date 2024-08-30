return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>h",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Harpoon: Menu",
		},
		{
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon: Add",
		},
		{
			"<leader>hd",
			function()
				require("harpoon"):list():remove()
			end,
			desc = "Harpoon: Remove",
		},
		{
			"<C-m>",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Harpoon: Prev",
		},
		{
			"<C-/>",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Harpoon: Next",
		},
	},
	config = function()
		local harpoon = require("harpoon")
		local map = vim.keymap.set

		harpoon.setup()

		harpoon:extend({
			UI_CREATE = function(cx)
				map("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })

				map("n", "<C-s>", function()
					harpoon.ui:select_menu_item({ split = true })
				end, { buffer = cx.bufnr })
			end,
		})
	end,
}

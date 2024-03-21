return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"<leader>h",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Harpoon: Menu",
		},
		{
			"<leader>a",
			function()
				require("harpoon"):list():append()
			end,
			desc = "Harpoon: Add",
		},
		{
			"[h",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Harpoon: Previous",
		},
		{
			"]h",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Harpoon: Next",
		},
		{
			"<leader>h1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon: Select 1",
		},
		{
			"<leader>h2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon: Select 2",
		},
		{
			"<leader>h3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon: Select 3",
		},
		{
			"<leader>h4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon: Select 4",
		},
	},
}

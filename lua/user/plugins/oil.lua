-- GOAT of file manager

return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<leader>e",
			function()
				require("oil").toggle_float()
			end,
			desc = "Oil File Explorer",
		},
	},
	opts = {
		default_file_explorer = true,
		keymaps = {
			["h"] = "actions.parent",
			["l"] = "actions.select",
		},
		view_options = {
			show_hidden = true,
		},
		float = {
			max_width = 100,
			max_height = 50,
		},
		skip_confirm_for_simple_edits = true,
	},
}

-- GOAT of file manager

local M = {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

function M.config()
	-- keymaps
	map("n", "<leader>e", "<cmd>lua require('oil').toggle_float()<cr>", "Oil")

	require("oil").setup({
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
	})
end

return M

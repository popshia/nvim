-- GOAT of file manager

local M = {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

function M.config()
	require("oil").setup({
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),

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

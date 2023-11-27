-- leetcode plugin

local M = {
	"Dhanus3133/LeetBuddy.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	event = "VeryLazy",
}

function M.config()
	require("leetbuddy").setup({
		domain = "com",
		language = "cpp",
		limit = 30, -- Number of problems displayed in telescope
		keys = {
			select = "<CR>",
			reset = "<C-r>",
			easy = "<C-e>",
			medium = "<C-m>",
			hard = "<C-d>",
			accepted = "<C-a>",
			not_started = "<C-y>",
			tried = "<C-t>",
			page_next = "<C-l>",
			page_prev = "<C-h>",
		},
	})
end

return M

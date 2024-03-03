-- quickly jump to text

local M = {
	"folke/flash.nvim",
	event = "VeryLazy",
	keys = {
		{
			"s",
			function()
				require("flash").jump()
			end,
			mode = { "n", "x", "o" },
			desc = "Search Flash",
		},
		{
			"r",
			function()
				require("flash").remote()
			end,
			mode = "o",
			desc = "Remote Flash",
		},
	},
}

function M.config()
	require("flash").setup({
		search = {
			multi_window = false,
		},
		jump = {
			nohlsearch = true,
			autojump = true,
		},
		modes = {
			search = {
				enabled = false,
			},
			char = {
				enabled = false,
				multi_line = false,
			},
		},
	})
end

return M

-- quickly jump to text

local M = {
	"folke/flash.nvim",
	event = "VeryLazy",
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
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

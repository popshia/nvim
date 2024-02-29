-- hop between lines

local M = {
	"phaazon/hop.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"s<leader>",
			function()
				require("hop").hint_lines()
			end,
			desc = "Hop lines",
		},
	},
}

return M

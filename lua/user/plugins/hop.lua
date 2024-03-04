-- hop between lines

return {
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

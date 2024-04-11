-- quickly jump to text

return {
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
	config = function()
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
				},
			},
		})
	end,
}

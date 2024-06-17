-- better commenting

return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	lazy = false,
	keys = {
		{
			"<leader>c",
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			desc = "Comment Line",
		},
		{
			"<leader>c",
			"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
			mode = { "v" },
			desc = "Comment Block",
		},
	},
	opts = {},
}

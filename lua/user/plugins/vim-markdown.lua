local M = {
	"preservim/vim-markdown",
	dependencies = {
		{
			"godlygeek/tabular",
			event = "VeryLazy",
		},
		{
			"iamcco/markdown-preview.nvim",
			build = function()
				vim.fn["mkdp#util#install"]()
			end,
			event = "VeryLazy",
		},
	},
	event = "VeryLazy",
}

return M

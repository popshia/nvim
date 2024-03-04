-- vim markdown mode

return {
	"preservim/vim-markdown",
	ft = "markdown",
	dependencies = {
		{
			"godlygeek/tabular",
		},
		{
			"iamcco/markdown-preview.nvim",
			build = function()
				vim.fn["mkdp#util#install"]()
			end,
		},
	},
}

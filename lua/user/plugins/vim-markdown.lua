-- vim markdown mode

return {
	"preservim/vim-markdown",
	ft = "markdown",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	dependencies = {
		{
			"iamcco/markdown-preview.nvim",
			build = function()
				vim.fn["mkdp#util#install"]()
			end,
		},
		{
			"lukas-reineke/headlines.nvim",
			opts = {},
		},
	},
}

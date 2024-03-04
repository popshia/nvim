-- generate docstring

return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	opts = {},
	keys = {
		{
			"<leader>gd",
			"<cmd>Neogen<CR>",
			desc = "Documentation Comment",
		},
	},
}

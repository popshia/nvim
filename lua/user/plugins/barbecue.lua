-- show document symbols in winbar

return {
	"utilyre/barbecue.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	event = "VimEnter",
	config = function()
		require("barbecue").setup({
			exclude_filetypes = {
				"toggleterm",
				"oil",
				"alpha",
				"lazy",
			},
			create_autocmd = false,
			show_basename = false,
		})
	end,
}

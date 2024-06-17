-- show document symbols in winbar

return {
	"utilyre/barbecue.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	event = "VimEnter",
	opts = {
		exclude_filetypes = {
			"toggleterm",
			"oil",
			"alpha",
			"lazy",
		},
		create_autocmd = false,
		show_basename = false,
	},
}

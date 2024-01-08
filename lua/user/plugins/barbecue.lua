-- show document symbols in winbar

local M = {
	"utilyre/barbecue.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	event = "VimEnter",
}

function M.config()
	require("barbecue").setup({
		exclude_filetypes = {
			"netrw",
			"toggleterm",
			"oil",
			"alpha",
			"lazy",
		},
		show_dirname = false,
		show_basename = false,
	})
end

return M

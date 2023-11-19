local M = {
  	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
  	event = "VeryLazy",
}

function M.config()
	local icons = require "user.utils.icons"

	require("ibl").setup({
		scope = {
			show_exact_scope = true,
		},
		exclude = {
			buftypes = {
				"terminal",
				"nofile",
				"alpha"
			},
			filetypes = {
				"help",
				"dashboard",
				"lazy",
				"NvimTree",
				"Trouble",
				"text",
			},
		},
	})
end

return M

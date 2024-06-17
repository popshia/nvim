-- show indents

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "VeryLazy",
	opts = {
		scope = {
			show_exact_scope = true,
		},
		exclude = {
			buftypes = {
				"terminal",
				"nofile",
				"alpha",
			},
			filetypes = {
				"help",
				"dashboard",
				"lazy",
				"Trouble",
				"text",
			},
		},
	},
}

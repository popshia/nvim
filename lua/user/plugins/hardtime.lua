return {
	"m4xshen/hardtime.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.notify = require("notify")
		require("hardtime").setup({
			disable_mouse = false,
			max_count = 5,
			allow_different_key = true,
			disabled_filetypes = {
				"alpha",
				"help",
				"lazy",
				"NeogitStatus",
				"NeogitLogView",
				"markdown",
				"mason",
				"minifiles",
				"notify",
				"sagaoutline",
				"prompt",
				"oil",
			},
		})
	end,
}

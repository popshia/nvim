-- diffview plugin

local M = {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
	},
}

M.config = true

return M

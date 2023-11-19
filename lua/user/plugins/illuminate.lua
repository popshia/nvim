local M = {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
}

function M.config()
	require("illuminate").configure({
		filetypes_denylist = {
			"alpha",
			"mason",
			"lazy",
			"NvimTree",
			"toggleterm",
			"TelescopePrompt",
		},
	})
end

return M

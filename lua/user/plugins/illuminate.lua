-- highlight same word in buffer

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
			"toggleterm",
			"TelescopePrompt",
		},
	})
end

return M

-- navic buddy with symbol outline

local M = {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
	},
}

function M.config()
	require("nvim-navbuddy").setup({
		window = {
			border = "rounded",
		},
		icons = require("user.utils.icons").kind,
		lsp = {
			auto_attach = true,
		},
	})
end

return M

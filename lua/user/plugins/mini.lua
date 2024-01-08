-- animate neovim animations

local M = {
	"echasnovski/mini.nvim",
	version = false,
}

function M.config()
	-- require("mini.animate").setup()
	-- require("mini.surround").setup()
	require("mini.ai").setup()
	require("mini.bracketed").setup()
end

return M

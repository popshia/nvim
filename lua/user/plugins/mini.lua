-- animate neovim animations

local M = {
	"echasnovski/mini.nvim",
	version = false,
}

function M.config()
	-- require("mini.animate").setup()
	require("mini.ai").setup()
	require("mini.bracketed").setup()
	-- require("mini.surround").setup({ n_lines = 500 })
end

return M

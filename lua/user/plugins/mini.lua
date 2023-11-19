local M = {
	"echasnovski/mini.nvim",
	version = false,
}

function M.config()
	require("mini.animate").setup()
end

return M

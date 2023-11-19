local M = {
	-- "kylechui/nvim-surround",
	"echasnovski/mini.nvim",
	version = false,
	event = "BufEnter",
}

function M.config()
	require("mini.surround").setup()
end

return M

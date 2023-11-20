local M = {
	"nguyenvukhang/nvim-toggler",
	event = "VeryLazy",
}

function M.config()
	require("nvim-toggler").setup()
end

return M

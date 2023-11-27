-- toggle text like true false etc...

local M = {
	"nguyenvukhang/nvim-toggler",
	event = "VeryLazy",
}

function M.config()
	require("nvim-toggler").setup()
end

return M

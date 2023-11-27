-- add surroundings for text

local M = {
	"kylechui/nvim-surround",
}

function M.config()
	require("nvim-surround").setup()
end

return M

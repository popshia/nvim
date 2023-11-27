-- add documentations to neovim developing functions

local M = {
	"folke/neodev.nvim",
}

function M.config()
	require("neodev").setup({})
end

return M

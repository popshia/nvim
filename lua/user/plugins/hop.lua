local M = {
	"phaazon/hop.nvim",
	event = "VeryLazy",
}

function M.config()
	require("hop").setup({})
	local hop = require("hop")
	local map = vim.keymap.set

	map("", "S", function()
		hop.hint_lines()
	end, { remap = true })
end

return M

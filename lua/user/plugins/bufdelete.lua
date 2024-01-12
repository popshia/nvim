-- better buffer delete

local M = {
	"famiu/bufdelete.nvim",
	event = "VeryLazy",
}

function M.config()
	local keymap = vim.keymap.set
	local opts = { noremap = true, silent = true }
	keymap("n", "q", ":lua require('bufdelete').bufdelete(0, false)<cr>", opts)
end

return M

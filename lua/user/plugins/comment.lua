-- better commenting

local M = {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	lazy = false,
}

function M.config()
	-- keymaps
	map("n", "<leader>c", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", "Comment")
	map("v", "<leader>c", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", "Comment")

	require("Comment").setup()
end

return M

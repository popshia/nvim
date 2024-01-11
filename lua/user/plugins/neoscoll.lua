local M = {
	"karb94/neoscroll.nvim",
	event = "BufEnter",
}

function M.config()
	require("neoscroll").setup({
		stop_eof = false,
		respect_scrolloff = false,
		post_hook = function()
			vim.cmd("norm! zz")
		end,
	})
end

return M

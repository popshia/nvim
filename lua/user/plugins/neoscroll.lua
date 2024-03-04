-- smooth scroll

return {
	"karb94/neoscroll.nvim",
	event = "BufEnter",
	config = function()
		require("neoscroll").setup({
			stop_eof = false,
			respect_scrolloff = false,
			post_hook = function()
				vim.cmd("norm! zz")
			end,
		})
	end,
}

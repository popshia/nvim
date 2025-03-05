-- smooth scroll

return {
	"karb94/neoscroll.nvim",
	event = "BufEnter",
	opts = {
		stop_eof = false,
		respect_scrolloff = false,
		perfomance_mode = true,
		post_hook = function()
			vim.cmd("norm! zz")
		end,
	},
}

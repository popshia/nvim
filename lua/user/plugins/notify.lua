-- prettier notifications

return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			fps = 144,
			render = "compact",
			stages = "fade_in_slide_out",
			timeout = 3,
		})
	end,
}

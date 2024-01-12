local M = {
	"rcarriga/nvim-notify",
}

function M.config()
	require("notify").setup({
		fps = 144,
		render = "compact",
		stages = "fade_in_slide_out",
		timeout = 3,
	})
end

return M

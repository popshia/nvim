local M = {
	"kevinhwang91/nvim-hlslens",
	event = "InsertEnter",
}

function M.config()
	require("hlslens").setup({
		calm_down = true,
		nearest_only = true,
		nearest_float_when = "auto",
	})
end

return M

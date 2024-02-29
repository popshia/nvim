-- gitsigns integration in nvim

local M = {
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	cmd = "Gitsigns",
}

function M.config()
	require("gitsigns").setup({
		signs = {
			add = { text = "│" }, -- "+"
			change = { text = "│" }, -- "~"
			delete = { text = "_" }, -- "-"
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
	})
end

return M

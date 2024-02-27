-- bufferline enhancement

local M = {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "BufEnter",
}

function M.config()
	-- keymaps
	map("n", "<leader>bp", "<cmd>BufferLinePick<cr>", "Pick Buffer")
	map("n", "<leader>bd", "<cmd>lua require('bufdelete').bufdelete(0, false)<cr>", "Close Buffer")

	require("bufferline").setup({
		options = {
			numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
			show_close_icon = false,
			separator_style = "thin", -- | "thick" | "thin" | "slant" | "padded_slant"
			indicator = {
				icon = "▎", -- this should be omitted if indicator style is not 'icon'
				-- style = 'icon' | 'underline' | 'none',
			},
			hover = {
				enabled = true,
				delay = 100,
				reveal = { "close" },
			},
		},
	})
end

return M

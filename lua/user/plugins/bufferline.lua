local M = {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
}

function M.config()
	require("bufferline").setup({
		options = {
			numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
			show_close_icon = false,
			offsets = { { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", seprator = true } },
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

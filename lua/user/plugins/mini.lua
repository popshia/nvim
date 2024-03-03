-- animate neovim animations

local M = {
	"echasnovski/mini.nvim",
	version = false,
}

function M.config()
	-- require("mini.surround").setup({ n_lines = 500 })

	-- Extend and create a/i textobjects
	require("mini.ai").setup()

	-- Fast and feature-rich surround actions
	require("mini.move").setup({
		mappings = {
			left = "H",
			down = "J",
			up = "K",
			right = "L",
			line_left = "H",
			line_down = "J",
			line_up = "K",
			line_right = "L",
		},
	})

	-- Jump to next/previous single character
	require("mini.jump").setup({ delay = { highlight = 10 ^ 7 } })

	-- Show next key clues
	require("mini.clue").setup({
		triggers = {
			{ mode = "n", keys = "<Leader>" },
			{ mode = "x", keys = "<Leader>" },
		},
	})
end

return M

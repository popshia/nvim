-- animate neovim animations

return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- Extend and create a/i textobjects
		require("mini.ai").setup()
		-- Jump to next/previous single character
		require("mini.jump").setup({ delay = { highlight = 10 ^ 7 } })
	end,
}

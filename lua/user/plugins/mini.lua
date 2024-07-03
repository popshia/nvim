-- mini plugins

return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- Extend and create a/i textobjects
		require("mini.ai").setup()
		-- Go forward/backward with square brackets
		require("mini.bracketed").setup({ file = { suffix = "", options = {} } })
		-- Jump to next/previous single character
		-- require("mini.jump").setup({ delay = { highlight = 10 ^ 7 } })
	end,
}

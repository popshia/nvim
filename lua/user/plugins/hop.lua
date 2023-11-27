-- hop between lines

local M = {
	"phaazon/hop.nvim",
	event = "VeryLazy",
}

function M.config()
	require("hop").setup({})
	local hop = require("hop")
	local directions = require("hop.hint").HintDirection
	local map = vim.keymap.set

	-- map("", "f", function()
	-- 	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
	-- end, { remap = true })
	--
	-- map("", "F", function()
	-- 	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
	-- end, { remap = true })
	--
	-- map("", "t", function()
	-- 	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
	-- end, { remap = true })
	--
	-- map("", "T", function()
	-- 	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
	-- end, { remap = true })
	--
	-- map("", "s", function()
	-- 	hop.hint_char2()
	-- end, { remap = true })

	map("", "s<leader>", function()
		hop.hint_lines()
	end, { remap = true })
end

return M

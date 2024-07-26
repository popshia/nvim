-- colorize todo comments

return {
	"folke/todo-comments.nvim",
	event = "BufEnter",
	config = function()
		local icons = require("user.utils.icons")

		require("todo-comments").setup({
			signs = false,
			keywords = {
				-- TODO: this is a todo.
				TODO = { icon = icons.ui.Check, color = "#E9B143" },
				-- REVIEW: review this line.
				REVIEW = { icon = icons.ui.BookMark, color = "#B0B846" },
				-- FIXME: fix me plz.
				FIXME = { icon = icons.ui.Bug, color = "#F2594B" },
				-- NOTE: a note for myself.
				NOTE = { icon = icons.ui.Note, color = "#80AA9E" },
				-- TEST: testing info.
				TEST = { icon = icons.diagnostics.Information, color = "#D3869B" },
			},
			gui_style = {
				fg = "BOLD", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
			highlight = {
				before = "", -- "fg" or "bg" or empty
				keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
				after = "fg", -- "fg" or "bg" or empty
			},
		})
	end,
}

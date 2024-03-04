-- colorize todo comments

return {
	"folke/todo-comments.nvim",
	event = "BufEnter",
	config = function()
		local icons = require("user.utils.icons")

		require("todo-comments").setup({
			signs = false,
			keywords = {
				FIXME = { icon = icons.ui.Bug, color = "#f2594b" },
				NOTE = { icon = icons.ui.Note, color = "#80aa9e" },
				INFO = { icon = icons.diagnostics.Information, color = "#d3869b" },
				TODO = { icon = icons.ui.Check, color = "#e9b143" },
				REVIEW = { icon = icons.ui.Pencil, color = "#b0b846" },
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

		-- Preview below:
		-- TODO:
		-- REVIEW:
		-- FIXME:
		-- NOTE:
		-- INFO:
	end,
}

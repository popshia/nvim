-- colorize todo comments

local M = {
	"folke/todo-comments.nvim",
	event = "BufEnter",
}

function M.config()
	local icons = require("user.utils.icons")

	require("todo-comments").setup({
		signs = true, -- show icons in the signs column
		sign_priority = 8, -- sign priority
		-- keywords recognized as todo comments
		keywords = {
			FIXME = {
				icon = icons.ui.Bug, -- icon used for the sign, and in search results
				color = "#f2594b", -- can be a hex color, or a named color (see below)
			},
			NOTE = {
				icon = icons.ui.Note,
				color = "#80aa9e",
				alt = {},
			},
			INFO = { icon = icons.diagnostics.Information, color = "#d3869b" },
			TODO = { icon = icons.ui.Check, color = "#e9b143" },
			REVIEW = { icon = icons.ui.Pencil, color = "#b0b846" },
		},
		gui_style = {
			fg = "BOLD", -- The gui style to use for the fg highlight group.
			bg = "BOLD", -- The gui style to use for the bg highlight group.
		},
		merge_keywords = true, -- when true, custom keywords will be merged with the defaults
		-- highlighting of the line containing the todo comment
		-- * before: highlights before the keyword (typically comment characters)
		-- * keyword: highlights of the keyword
		-- * after: highlights after the keyword (todo text)
		highlight = {
			multiline = true, -- enable multine todo comments
			multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
			multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
			before = "fg", -- "fg" or "bg" or empty
			keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
			after = "fg", -- "fg" or "bg" or empty
			pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
			comments_only = true, -- uses treesitter to match keywords in comments only
			max_line_len = 400, -- ignore lines longer than this
			exclude = {}, -- list of file types to exclude highlighting
		},
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			-- regex that will be used to match keywords.
			-- don't replace the (KEYWORDS) placeholder
			pattern = [[\b(KEYWORDS):]], -- ripgrep regex
			-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
		},
	})

	-- TODO:
	-- REVIEW:
	-- FIXME:
	-- NOTE:
	-- INFO:
end

return M

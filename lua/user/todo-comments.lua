local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
	return
end

todo_comments.setup({
	signs = true, -- show icons in the signs column
	sign_priority = 8, -- sign priority
	-- keywords recognized as todo comments
	keywords = {
		FIXME = {
			icon = " ", -- icon used for the sign, and in search results
			color = "#f2594b", -- can be a hex color, or a named color (see below)
		},
		INFO = { icon = "ℹ ", color = "#d3869b" },
		NOTE = { icon = " ", color = "#80aa9e", alt = {} },
		TODO = { icon = " ", color = "#e9b143" },
		REVIEW = { icon = "✎ ", color = "#b0b846" },
	},
	merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	-- highlighting of the line containing the todo comment
	-- * before: highlights before the keyword (typically comment characters)
	-- * keyword: highlights of the keyword
	-- * after: highlights after the keyword (todo text)
	highlight = {
		before = "bg", -- "fg" or "bg" or empty
		keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
		after = "bg", -- "fg" or "bg" or empty
		pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
		comments_only = true, -- uses treesitter to match keywords in comments only
		max_line_len = 400, -- ignore lines longer than this
		exclude = {}, -- list of file types to exclude highlighting
	},
	-- list of named colors where we try to extract the guifg from the
	-- list of hilight groups or use the hex color if hl not found as a fallback
	-- colors = {
	-- 	error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
	-- 	warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
	-- 	info = { "DiagnosticInfo", "#2563EB" },
	-- 	hint = { "DiagnosticHint", "#10B981" },
	-- 	default = { "Identifier", "#7C3AED" },
	-- },
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

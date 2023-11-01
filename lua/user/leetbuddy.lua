local status_ok, buddy = pcall(require, "leetbuddy")
if not status_ok then
	return
end

buddy.setup({
	domain = "com",
	language = "cpp",
	limit = 30, -- Number of problems displayed in telescope
	keys = {
		select = "<CR>",
		reset = "<C-r>",
		easy = "<C-e>",
		medium = "<C-m>",
		hard = "<C-d>",
		accepted = "<C-a>",
		not_started = "<C-y>",
		tried = "<C-t>",
		page_next = "<C-l>",
		page_prev = "<C-h>",
	}
})

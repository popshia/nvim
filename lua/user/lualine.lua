local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local gps = require("nvim-gps")
gps.setup({
	icons = {
		["class-name"] = " ", -- Classes and class-like objects
		["function-name"] = " ", -- Functions
		["method-name"] = " ", -- Methods (functions inside class-like objects)
		["container-name"] = "離", -- Containers (example: lua tables)
		["tag-name"] = "炙", -- Tags (example: html tags)
	},
})

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

-- local mode = {
-- 	"mode",
-- 	fmt = function(str)
-- 		return "-- " .. str .. " --"
-- 	end,
-- }

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				gps.get_location,
				cond = gps.is_available,
			},
		},
		lualine_c = {
			-- {
			-- 	gps.get_location,
			-- 	cond = gps.is_available,
			-- },
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
				shorting_target = 40, -- Shortens path to leave 40 space in the window
				-- for other components. Terrible name any suggestions?
				symbols = {
					modified = "[+]", -- when the file was modified
					readonly = "[-]", -- if the file is not modifiable or readonly
					unnamed = "[No Name]", -- default display name for unnamed buffers
				},
			},
		},
		lualine_x = { filetype, spaces },
		lualine_y = { branch, diff, diagnostics },
		lualine_z = { "location" },

		-- lualine_a = { 'mode' },
		-- lualine_b = { branch, diagnostics },
		-- lualine_c = { 'filename' },
		-- -- lualine_x = { "encoding", "fileformat", "filetype" },
		-- lualine_x = { diff, spaces, "encoding", filetype },
		-- lualine_y = { location },
		-- lualine_z = { },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
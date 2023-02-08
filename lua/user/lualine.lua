local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local navic = require("nvim-navic")
navic.setup({
	icons = {
		File          = " ",
		Module        = " ",
		Namespace     = " ",
		Package       = " ",
		Class         = " ",
		Method        = " ",
		Property      = " ",
		Field         = " ",
		Constructor   = " ",
		Enum          = "練",
		Interface     = "練",
		Function      = " ",
		Variable      = " ",
		Constant      = " ",
		String        = " ",
		Number        = " ",
		Boolean       = "◩ ",
		Array         = " ",
		Object        = " ",
		Key           = " ",
		Null          = "ﳠ ",
		EnumMember    = " ",
		Struct        = " ",
		Event         = " ",
		Operator      = " ",
		TypeParameter = " ",
	},
	highlight = false,
	separator = " > ",
	depth_limit = 0,
	depth_limit_indicator = "..",
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
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = false,
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

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "Outline" },
		-- disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { branch, diff },
		lualine_c = { diagnostics },
		lualine_x = { spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { "progress" },
	},
	tabline = {},
})

-- statusline plugin

local M = {
	"nvim-lualine/lualine.nvim",
	event = "BufEnter",
}

function M.config()
	local hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end

	local icons = require("user.utils.icons")

	local diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		sections = { "error", "warn" },
		symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
		colored = true,
		update_in_insert = false,
		always_visible = true,
	}

	local diff = {
		"diff",
		colored = true,
		symbols = { added = "+", modified = "~", removed = "-" }, -- changes diff symbols
		cond = hide_in_width,
	}

	local filetype = {
		"filetype",
		icons_enabled = true,
	}

	local branch = {
		"branch",
		icons_enabled = true,
		icon = "",
	}

	local location = {
		"location",
		padding = 1,
	}

	local spaces = function()
		return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
	end

	require("lualine").setup({
		options = {
			globalstatus = true,
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard", "Outline" },
			always_divide_middle = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { branch },
			lualine_c = { diff, diagnostics },
			lualine_x = { spaces, "encoding", filetype },
			lualine_y = { location },
			lualine_z = { "progress" },
		},
		tabline = {},
	})
end

return M

-- statusline plugin

return {
	"nvim-lualine/lualine.nvim",
	event = "BufEnter",
	config = function()
		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " " },
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

		local datetime = function()
			return os.date("%H:%M")
		end

		local spaces = function()
			return "spaces: " .. vim.api.nvim_buf_get_option_value(0, "shiftwidth")
		end

		require("lualine").setup({
			options = {
				globalstatus = true,
				theme = "auto",
				section_separators = {},
				component_separators = { left = "|", right = "|" },
				disabled_filetypes = { "alpha", "dashboard", "Outline" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { branch, diff },
				lualine_c = { "filename" },
				lualine_x = { spaces, filetype },
				lualine_y = { diagnostics },
				lualine_z = { datetime },
			},
		})
	end,
}

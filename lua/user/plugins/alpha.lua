-- startup screen

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		local function footer()
			local datetime = os.date(" %Y-%m-%d    %H:%M ")
			local nvim_version = vim.version()
			local nvim_version_info = "    v"
				.. nvim_version.major
				.. "."
				.. nvim_version.minor
				.. "."
				.. nvim_version.patch
			local total_plugins = #vim.tbl_keys(require("lazy").plugins())
			local plugin_info = "   " .. total_plugins .. " plugins"
			return datetime .. plugin_info .. nvim_version_info
		end

		dashboard.section.header.val = {
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
			[[                                   _              ]],
			[[       ____   ___   ____  _   _   (_) ____ ___    ]],
			[[      / __ \ / _ \ / __ \| | / / / / / __ `__ \   ]],
			[[     / / / //  __// /_/ /| |/ / / / / / / / / /   ]],
			[[    /_/ /_/ \___/ \____/ |___/ /_/ /_/ /_/ /_/    ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("t", "  Find text", ":Telescope live_grep<CR>"),
			dashboard.button("s", "󰓦  Sync plugins", ":Lazy sync<CR>"),
			dashboard.button("m", "󰏓  Mason", ":Mason<CR>"),
			-- dashboard.button("l", icons.ui.Project .. " Leetcode", ":Leet list<CR>"),
			dashboard.button("q", "󰩈  Quit Neovim", ":qa<CR>"),
		}

		dashboard.section.footer.val = {
			[[                                        ]],
			[[          "stay hungry, stay foolish."  ]],
			[[                                        ]],
			footer(),
			[[                                        ]],
			[[                                        ]],
			[[                                        ]],
			[[                                        ]],
			[[                                        ]],
			[[                                        ]],
			[[                                        ]],
			[[                                        ]],
		}

		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.opts.opts.noautocmd = true
		require("alpha").setup(dashboard.opts)
	end,
}

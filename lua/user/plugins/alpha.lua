-- startup screen

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		local icons = require("user.utils.icons")
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
			dashboard.button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("f", icons.ui.Files .. " Find file", ":Telescope find_files<CR>"),
			dashboard.button("t", icons.ui.List .. " Find text", ":Telescope live_grep<CR>"),
			dashboard.button("s", icons.ui.CloudDownload .. " Sync plugins", ":Lazy sync<CR>"),
			dashboard.button("g", icons.git.Octoface .. " Neogit", ":Neogit<CR>"),
			dashboard.button("q", icons.ui.SignOut .. " Quit Neovim", ":qa<CR>"),
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

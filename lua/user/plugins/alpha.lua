-- startup screen plugin

local M = {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
}

function M.config()
	local dashboard = require("alpha.themes.dashboard")
	local icons = require("user.utils.icons")

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
		[[                                                  ]],
	}
	dashboard.section.buttons.val = {
		dashboard.button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert<CR>"),
		dashboard.button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles<CR>"),
		dashboard.button("f", icons.ui.Files .. " Find file", ":Telescope find_files<CR>"),
		dashboard.button("p", icons.ui.Project .. " Find project", ":Telescope projects<CR>"),
		dashboard.button("t", icons.ui.List .. " Find text", ":Telescope live_grep<CR>"),
		dashboard.button("u", icons.ui.CloudDownload .. " Update plugins", ":Lazy sync<CR>"),
		dashboard.button("q", icons.ui.SignOut .. " Quit Neovim", ":qa<CR>"),
	}

	dashboard.section.footer.val = {
		[[                              ]],
		[[                              ]],
		[[  stay hungry, stay foolish.  ]],
		[[                              ]],
		[[                              ]],
		[[                              ]],
		[[                              ]],
		[[                              ]],
		[[                              ]],
		[[                              ]],
		[[                              ]],
		[[                              ]],
	}

	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Include"
	dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.opts.opts.noautocmd = true
	require("alpha").setup(dashboard.opts)
end

return M

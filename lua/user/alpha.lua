local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
local icons = require("user.icons")

dashboard.section.header.val = {
	[[                                                 ]],
	[[                                                 ]],
	[[                                                 ]],
	[[                                                 ]],
	[[                                                 ]],
	[[                                                 ]],
	[[                                                 ]],
	[[                                                 ]],
	[[                                  _              ]],
	[[      ____   ___   ____  _   _   (_) ____ ___    ]],
	[[     / __ \ / _ \ / __ \| | / / / / / __ `__ \   ]],
	[[    / / / //  __// /_/ /| |/ / / / / / / / / /   ]],
	[[   /_/ /_/ \___/ \____/ |___/ /_/ /_/ /_/ /_/    ]],
	-- [[                               __                ]],
	-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", icons.documents.Files .. " Find file", ":Telescope find_files <CR>"),
	dashboard.button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", icons.git.Repo .. " Find project", ":Telescope projects <CR>"),
	dashboard.button("r", icons.ui.History .. " Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", icons.ui.List .. " Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", icons.ui.Gear .. " Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("u", icons.ui.CloudDownload .. " Update plugins", ":Lazy sync<CR>"),
	dashboard.button("q", icons.ui.SignOut .. " Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.val = {
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
	[[                              ]],
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "oil" },
	callback = function()
		vim.cmd([[
			nnoremap <silent> <buffer> q :close<CR>
			set nobuflisted
		]])
	end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
	pattern = { "AlphaReady" },
	callback = function()
		vim.cmd([[
			set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
			set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
		]])
	end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Toggle relative number between normal and insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	callback = function()
		vim.opt.relativenumber = false
	end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function()
		vim.opt.relativenumber = true
	end,
})

-- better winbar symbol performance
vim.api.nvim_create_autocmd({
	"WinResized", -- or WinResized on NVIM-v0.9 and higher
	"BufWinEnter",
	"CursorHold",
	"InsertLeave",
}, {
	group = vim.api.nvim_create_augroup("barbecue.updater", {}),
	callback = function()
		require("barbecue.ui").update()
	end,
})

-- htmldjango files
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
-- 	pattern = { "*.html" },
-- 	callback = function()
-- 		vim.cmd("setfiletype htmldjango")
-- 	end,
-- })

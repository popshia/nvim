-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- map leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install your plugins here
require("lazy").setup({ { import = "user.plugins" } }, {
	install = {
		colorscheme = { "gruvbox-material" },
	},
	ui = {
		border = "rounded",
	},
	change_detection = {
		enabled = true,
		notify = true,
	},
})

-- keymaps
map("n", "<leader>pi", "<cmd>Lazy show<cr>", "Info")
map("n", "<leader>ps", "<cmd>Lazy sync<cr>", "Sync")
map("n", "<leader>pl", "<cmd>Lazy log<cr>", "Log")
map("n", "<leader>pp", "<cmd>Lazy profile<cr>", "Profile")
map("n", "<leader>pu", "<cmd>Lazy update<cr>", "Update")
map("n", "<leader>pc", "<cmd>Lazy clean<cr>", "Clean")

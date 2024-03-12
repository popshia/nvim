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
	colorscheme = { "gruvbox-material" },
	ui = {
		border = "rounded",
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
})

-- keymaps
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy show<CR>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>ls", "<cmd>Lazy sync<CR>", { desc = "Lazy: Sync" })
vim.keymap.set("n", "<leader>lu", "<cmd>Lazy update<CR>", { desc = "Lazy: Update" })
vim.keymap.set("n", "<leader>lc", "<cmd>Lazy clean<CR>", { desc = "Lazy: Clean" })
vim.keymap.set("n", "<leader>lp", "<cmd>Lazy profile<CR>", { desc = "Lazy: Profile" })
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy log<CR>", { desc = "Lazy: Log" })

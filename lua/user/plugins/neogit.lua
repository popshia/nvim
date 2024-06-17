-- git within nvim

return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>ng", "<cmd>Neogit<CR>", desc = "Neogit" },
	},
	opts = {},
}

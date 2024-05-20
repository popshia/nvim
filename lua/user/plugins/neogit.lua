-- git within nvim

return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	opts = {},
	cmd = "Neogit",
	keys = {
		{ "<leader>gt", "<cmd>Neogit<CR>", desc = "Neogit" },
		{ "]g", "<cmd>Gitsigns next_hunk<CR>", desc = "Next Hunk" },
		{ "[g", "<cmd>Gitsigns prev_hunk<CR>", desc = "Prev Hunk" },
		{ "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame" },
		{ "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset Hunk" },
		{ "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset Buffer" },
		{ "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
		{ "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk" },
		{ "<leader>go", "<cmd>Telescope git_status<CR>", desc = "Open changed file" },
		{ "<leader>gB", "<cmd>Telescope git_branches<CR>", desc = "Checkout branch" },
		{ "<leader>gC", "<cmd>Telescope git_commits<CR>", desc = "Checkout commit" },
		{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<CR>", desc = "Diff" },
	},
}

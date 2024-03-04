-- git within nvim

return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	opts = {},
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
		{ "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
		{ "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
		{ "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame" },
		{ "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
		{ "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
		{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
		{ "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
		{ "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
		{ "<leader>gB", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
		-- { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
	},
}

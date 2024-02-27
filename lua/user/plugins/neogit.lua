local M = {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
}

function M.config()
	-- keymaps
	map("n", "<leader>gg", "<cmd>Neogit<cr>", "Neogit")
	map("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", "Next Hunk")
	map("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk")
	map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", "Blame")
	map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk")
	map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk")
	map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer")
	map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk")
	map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk")
	map("n", "<leader>go", "<cmd>Telescope git_status<cr>", "Open changed file")
	map("n", "<leader>gB", "<cmd>Telescope git_branches<cr>", "Checkout branch")
	map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", "Checkout commit")
	map("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", "Diff")

	require("neogit").setup({})
end

return M

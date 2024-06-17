-- gitsigns integration in nvim

return {
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	keys = {
		{ "]g", "<cmd>Gitsigns next_hunk<CR>", desc = "Next Hunk" },
		{ "[g", "<cmd>Gitsigns prev_hunk<CR>", desc = "Prev Hunk" },
		{ "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame" },
		{ "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset Hunk" },
		{ "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset Buffer" },
		{ "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
		{ "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk" },
		{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<CR>", desc = "Diff" },
	},
	opts = {
		signs = {
			add = { text = "│" }, -- "+"
			change = { text = "│" }, -- "~"
			delete = { text = "_" }, -- "-"
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
	},
}

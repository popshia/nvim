-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists

return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	opts = {},
	keys = {
		{ "<leader>tt", "<cmd>TroubleToggle<CR>", desc = "Trouble: Toggle" },
		{
			"<leader>tp",
			"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<CR>",
			desc = "Trouble: Previous",
		},
		{
			"<leader>tn",
			"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<CR>",
			desc = "Trouble: Next",
		},
		{ "<leader>tl", "<cmd>TroubleToggle loclist<CR>", desc = "Trouble: Loclist" },
		{ "<leader>tq", "<cmd>TroubleToggle quickfix<CR>", desc = "Trouble: Quickfix" },
		{ "<leader>dd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Trouble: Document Diagnostics" },
		{ "<leader>wd", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Trouble: Workspace Diagnostics" },
	},
}

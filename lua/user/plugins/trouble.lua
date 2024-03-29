-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists

return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	cmd = "Trouble",
	keys = {
		{ "<leader>tt", "<cmd>TroubleToggle<CR>", desc = "Trouble: Toggle" },
		{
			"[t",
			"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<CR>",
			desc = "Trouble: Previous",
		},
		{
			"]t",
			"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<CR>",
			desc = "Trouble: Next",
		},
		{ "<leader>tl", "<cmd>TroubleToggle loclist<CR>", desc = "Trouble: Loclist" },
		{ "<leader>tq", "<cmd>TroubleToggle quickfix<CR>", desc = "Trouble: Quickfix" },
		{ "<leader>dd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Trouble: Document Diagnostics" },
		{ "<leader>wd", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Trouble: Workspace Diagnostics" },
		{ "<leader>td", "<cmd>TodoTrouble<CR>", desc = "Trouble: Todos" },
	},
}

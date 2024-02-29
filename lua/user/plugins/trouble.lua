local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>tt", "<cmd>TroubleToggle<cr>", desc = "Trouble: Toggle" },
		{
			"<leader>tp",
			"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>",
			desc = "Trouble: Previous",
		},
		{
			"<leader>tn",
			"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>",
			desc = "Trouble: Next",
		},
		{ "<leader>tl", "<cmd>TroubleToggle loclist<cr>", desc = "Trouble: Loclist" },
		{ "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble: Quickfix" },
		{ "<leader>dd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble: Document Diagnostics" },
		{ "<leader>wd", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble: Workspace Diagnostics" },
	},
}

function M.config()
	require("trouble").setup({})
end

return M

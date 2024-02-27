local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
	-- keymaps
	map("n", "<leader>tt", "<cmd>TroubleToggle<cr>", "Toggle")
	map("n", "<leader>tp", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", "Previous")
	map("n", "<leader>tn", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", "Next")
	map("n", "<leader>tl", "<cmd>TroubleToggle loclist<cr>", "Loclist")
	map("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", "Quickfix")
	map("n", "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>", "References")
	map("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics")
	map("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics")

	require("trouble").setup({})
end

return M

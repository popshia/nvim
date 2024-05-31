-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists

return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	keys = {
		{ "<leader>ls", "<cmd>Trouble lsp toggle <CR>", desc = "Trouble: LSP" },
		{ "<leader>dd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Trouble: Document Diagnostics" },
		{ "<leader>wd", "<cmd>Trouble diagnostics toggle<CR>", desc = "Trouble: Workspace Diagnostics" },
		{ "<leader>qf", "<cmd>Trouble quickfix toggle<CR>", desc = "Trouble: Quickfix" },
	},
	config = function()
		require("trouble").setup({
			focus = true,
		})
	end,
}

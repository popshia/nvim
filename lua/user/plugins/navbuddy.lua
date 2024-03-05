-- navic buddy with symbol outline

return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>so", "<cmd>Navbuddy<CR>", desc = "Symbol Outline" },
	},
	config = function()
		require("nvim-navbuddy").setup({
			window = {
				border = "rounded",
			},
			icons = require("user.utils.icons").kind,
			lsp = {
				auto_attach = true,
			},
		})
	end,
}

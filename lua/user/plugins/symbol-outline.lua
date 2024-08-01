-- symbol outline

return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>so", "<cmd>Outline<CR>", desc = "Symbol Outline" },
	},
	opts = {},
}

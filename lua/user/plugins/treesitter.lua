-- treesitter for syntax highlighting and symbol recognition

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		{ "windwp/nvim-autopairs", event = "InsertEnter" },
		-- { "nvim-treesitter/nvim-treesitter-context", event = "VeryLazy" },
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"comment",
				"fish",
				"gitignore",
				"lua",
				"markdown",
				"python",
				"vimdoc",
			},
			auto_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

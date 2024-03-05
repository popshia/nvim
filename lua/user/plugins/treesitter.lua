-- treesitter for syntax highlighting and symbol recognition

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		-- { "nvim-treesitter/nvim-treesitter-context", event = "VeryLazy" },
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"cpp",
				"comment",
				"fish",
				"gitignore",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"vimdoc",
			},
			auto_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

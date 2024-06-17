-- treesitter for syntax highlighting and symbol recognition

return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	opts = {
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
	},
}

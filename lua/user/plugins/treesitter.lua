local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		{
		  "nvim-treesitter/nvim-treesitter-context",
		  event = "VeryLazy",
		},
		{
		  "nvim-treesitter/nvim-treesitter-textobjects",
		  event = "VeryLazy",
		},
		{
		  "JoosepAlviste/nvim-ts-context-commentstring",
		  event = "VeryLazy",
		},
		{
		  "windwp/nvim-ts-autotag",
		  event = "VeryLazy",
		},
		{
		  "windwp/nvim-autopairs",
		  event = "InsertEnter",
		},
	},
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "bash", "fish", "lua", "markdown", "python", "vim", "cpp", "html" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		sync_install = true,                                                                   -- install languages synchronously (only applied to `ensure_installed`)
		autopairs = {
			enable = true,
		},
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "" }, -- list of language that will be disabled
			additional_vim_regex_highlighting = true,
		},
		indent = { enable = true, disable = { "css" } },
	})

	require("treesitter-context").setup({
		enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
		max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
		patterns = {
			-- Match patterns for TS nodes. These get wrapped to match at word boundaries.
			-- For all filetypes
			-- Note that setting an entry here replaces all other patterns for this entry.
			-- By setting the 'default' entry below, you can control which nodes you want to
			-- appear in the context window.
			default = {
				"class",
				"function",
				"method",
				-- 'for', -- These won't appear in the context
				-- 'while',
				-- 'if',
				-- 'switch',
				-- 'case',
			},
			-- Example for a specific filetype.
			-- If a pattern is missing, *open a PR* so everyone can benefit.
			--   rust = {
			--       'impl_item',
			--   },
		},
		exact_patterns = {
			-- Example for a specific filetype with Lua patterns
			-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
			-- exactly match "impl_item" only)
			-- rust = true,
		},
		-- [!] The options below are exposed but shouldn't require your attention,
		--     you can safely ignore them.

		zindex = 20, -- The Z-index of the context window
	})

	require("ts_context_commentstring").setup({})
	vim.g.skip_ts_context_commentstring_module = true
end

return M

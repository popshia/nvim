-- GOAT of fuzzy finder

local M = {
	"nvim-telescope/telescope.nvim", -- highly extendable fuzzy finder over lists
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim", -- fzf syntax support for telescope
			build = "make",
			lazy = true,
		},
		-- {
		-- 	"nvim-telescope/telescope-ui-select.nvim",
		-- },
	},
	lazy = true,
	cmd = "Telescope",
}

function M.config()
	-- keymaps
	-- theme=ivy (bottom panel overlay)
	-- theme=cursor (cursor relative list)
	-- theme=dropdown (list like centered list)
	map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", "Find Files")
	map("n", "<leader>ft", "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text")
	map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", "Recent Files")
	map("n", "<leader>fp", "<cmd>Telescope projects<cr>", "Projects")
	map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", "Buffers")
	map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", "Keymaps")
	map("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", "Colorscheme")
	map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", "Find Help")

	local icons = require("user.utils.icons")

	require("telescope").setup({
		defaults = {
			prompt_prefix = icons.ui.Telescope,
			selection_caret = icons.ui.Forward,
			path_display = { "smart" },
		},
		extensions = {
			-- ["ui-select"] = {
			-- 	require("telescope.themes").get_dropdown(),
			-- },
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	})

	require("telescope").load_extension("fzf")
	-- require("telescope").load_extension("ui-select")
end

return M

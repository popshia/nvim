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
	keys = {
		{ "<leader>ds", "<cmd>Telescope lsp_document_symbols theme=ivy<CR>", desc = "Document Symbols" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>ft", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find Recent Files" },
		{ "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Find Projects" },
		{ "<leader>fb", "<cmd>Telescope buffers theme=dropdown<cr>", desc = "Find Buffers" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps" },
		{ "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Find Colorscheme" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
		{
			"<leader>f/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end,
			desc = "Find In Current Buffer",
		},
		{
			"<leader>fn",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Neovim Files",
		},
	},
}

function M.config()
	-- keymaps
	-- theme=ivy (bottom panel overlay)
	-- theme=cursor (cursor relative list)
	-- theme=dropdown (list like centered list)

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
			},
		},
	})

	require("telescope").load_extension("fzf")
	-- require("telescope").load_extension("ui-select")
end

return M

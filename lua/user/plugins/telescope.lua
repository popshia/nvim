-- GOAT of fuzzy finder

return {
	"nvim-telescope/telescope.nvim", -- highly extendable fuzzy finder over lists
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim", -- fzf syntax support for telescope
			build = "make",
			lazy = true,
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ds", "<cmd>Telescope lsp_document_symbols theme=ivy<CR>", desc = "Document Symbols" },
		{ "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols theme=ivy<CR>", desc = "Workspace Symbols" },
		{ "<leader>sf", "<cmd>Telescope find_files<CR>", desc = "Search Files" },
		{ "<leader>st", "<cmd>Telescope live_grep theme=ivy<CR>", desc = "Search Text" },
		{ "<leader>sr", "<cmd>Telescope oldfiles<CR>", desc = "Search Recent Files" },
		{ "<leader>sb", "<cmd>Telescope buffers theme=dropdown<CR>", desc = "Search Buffers" },
		{ "<leader>sk", "<cmd>Telescope keymaps<CR>", desc = "Search Keymaps" },
		{ "<leader>sc", "<cmd>Telescope registers theme=cursor<CR>", desc = "Search Clipboard" },
		{ "<leader>go", "<cmd>Telescope git_status<CR>", desc = "Open changed file" },
		{ "<leader>gB", "<cmd>Telescope git_branches<CR>", desc = "Checkout branch" },
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Checkout commit" },
		{ "<leader>sd", "<cmd>TodoTelescope<CR>", desc = "Search Todos" },
		{
			"<leader>sn",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Neovim Files",
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
	end,
}

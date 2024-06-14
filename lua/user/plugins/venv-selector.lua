return {
	"linux-cultist/venv-selector.nvim",
	branch = "regexp",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	opts = {
		options = {
			fd_binary_name = "fdfind",
		},
		settings = {
			search = {
				conda_base = {
					command = "$FD '/python$' /home/noah/miniconda3/bin --full-path --color never -E /proc",
					type = "anaconda",
				},
				conda_envs = {
					command = "$FD '/bin/python$' /home/noah/miniconda3/envs/ --full-path --color never -E /proc",
					type = "anaconda",
				},
			},
		},
	},
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
	},
}

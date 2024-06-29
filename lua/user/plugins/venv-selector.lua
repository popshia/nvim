-- python virtual env selector

return {
	"linux-cultist/venv-selector.nvim",
	branch = "regexp",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
	},
	config = function()
		local system = vim.loop.os_uname().sysname
		local base_path = ""
		local env_path = ""

		if system == "Darwin" then
			base_path = "$FD '/python$' /opt/homebrew/Caskroom/miniconda/base/bin/ --full-path --color never -E /proc"
			env_path = "$FD '/python$' /opt/homebrew/Caskroom/miniconda/base/envs/ --full-path --color never -E /proc"
		elseif system == "Linux" then
			base_path = "$FD '/python$' /home/noah/miniconda3/bin/ --full-path --color never -E /proc"
			env_path = "$FD '/python$' /home/noah/miniconda3/envs/ --full-path --color never -E /proc"
		end

		require("venv-selector").setup({
			settings = {
				search = {
					conda_base = {
						command = base_path,
						type = "anaconda",
					},
					conda_envs = {
						command = env_path,
						type = "anaconda",
					},
				},
			},
		})
	end,
}

-- toggle terminal using ctrl+\

return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>lg", "<cmd>lua Lazygit_Toggle()<cr>", desc = "LazyGit" },
	},
	config = function()
		require("toggleterm").setup({
			size = 20,
			autochdir = true,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "rounded",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		function Lazygit_Toggle()
			lazygit:toggle()
		end
	end,
}

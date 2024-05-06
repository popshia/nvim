return {
	"David-Kunz/gen.nvim",
	cmd = "Gen",
	keys = {
		{
			"<leader>gg",
			"<cmd>Gen<cr>",
			mode = { "n" },
			desc = "Gen: Gen",
		},
		{
			"<leader>gc",
			"<cmd>Gen Chat<cr>",
			mode = { "n" },
			desc = "Gen: Chat",
		},
		{
			"<leader>gg",
			"<cmd>'<,'>Gen<cr>",
			mode = { "v" },
			desc = "Gen: Visual Gen",
		},
	},
	opts = {
		model = "llama3", -- The default model to use.
		display_mode = "split", -- The display mode. Can be "float" or "split".
		show_prompt = true, -- Shows the prompt submitted to Ollama.
		show_model = true, -- Displays which model you are using at the beginning of your chat session.
		no_auto_close = false, -- Never closes the window automatically.
	},
}

-- highlight same word in buffer

return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	config = function()
		require("illuminate").configure({
			filetypes_denylist = {
				"alpha",
				"mason",
				"lazy",
				"toggleterm",
				"TelescopePrompt",
			},
		})
	end,
	keys = {
		{
			"[[",
			function()
				require("illuminate")["goto_prev_reference"](false)
			end,
			desc = "Previous Reference",
		},
		{
			"]]",
			function()
				require("illuminate")["goto_next_reference"](false)
			end,
			desc = "Next Reference",
		},
	},
}

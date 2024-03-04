-- better buffer delete

return {
	"famiu/bufdelete.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>bd",
			function()
				require("bufdelete").bufdelete(0, false)
			end,
			desc = "Buffer Delete",
		},
	},
}

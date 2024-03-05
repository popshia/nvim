-- better buffer delete

return {
	"famiu/bufdelete.nvim",
	lazy = true,
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

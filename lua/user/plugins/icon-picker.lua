return {
	"ziontee113/icon-picker.nvim",
	config = function()
		require("icon-picker").setup({ disable_legacy_commands = true })
	end,
	keys = {
		{ "<leader>ip", "<cmd>IconPickerNormal alt_font symbols nerd_font nerd_font_v3<cr>", desc = "Icon Picker" },
	},
}

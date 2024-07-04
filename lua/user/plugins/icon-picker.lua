-- icon picker

return {
	"ziontee113/icon-picker.nvim",
	keys = {
		{
			"<leader>ip",
			"<cmd>IconPickerNormal alt_font symbols nerd_font nerd_font_v3<cr>",
			desc = "Icon Picker",
		},
		{
			"<leader>iy",
			"<cmd>IconPickerYank alt_font symbols nerd_font nerd_font_v3<cr>",
			desc = "Icon Picker Yank",
		},
		{
			"<leader>ii",
			"<cmd>IconPickerInsert alt_font symbols nerd_font nerd_font_v3<cr>",
			desc = "Icon Picker Insert",
		},
	},
	opts = {
		disable_legacy_commands = true,
	},
}

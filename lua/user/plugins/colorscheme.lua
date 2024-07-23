-- colorscheme

return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	init = function()
		-- g:gruvbox_material_background: hard, medium, soft
		vim.g.gruvbox_material_background = "medium"
		-- g:gruvbox_material_foreground & gruvbox_material_statusline_style: material, mix, original
		vim.g.gruvbox_material_foreground = "mix"
		vim.g.gruvbox_material_statusline_style = "mix"
		vim.g.gruvbox_material_enable_italic = 1
		vim.g.gruvbox_material_enable_bold = 1
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_dim_inactive_windows = 1
		vim.cmd.colorscheme("gruvbox-material")
	end,
}

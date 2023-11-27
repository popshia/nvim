-- gruvbox-material colorscheme

local M = {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
}

function M.config()
	-- g:gruvbox_material_background: hard, medium, soft
	-- g:gruvbox_material_foreground & gruvbox_material_statusline_style: material, mix, original
	vim.cmd([[
		let g:gruvbox_material_background = "medium"
		let g:gruvbox_material_foreground = "mix"
		let g:gruvbox_material_statusline_style = "mix"
		let g:gruvbox_material_enable_italic = 1
		let g:gruvbox_material_enable_bold = 1
		let g:gruvbox_material_better_performance = 1
	]])

	vim.o.background = "dark"
	vim.cmd.colorscheme("gruvbox-material")
end

return M

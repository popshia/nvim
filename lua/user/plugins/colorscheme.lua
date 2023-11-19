local M = {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
}

function M.config()
	vim.cmd([[
	  let g:gruvbox_material_palette = 'mix'
	  let g:gruvbox_material_statusline_style = 'mix'
	  let g:gruvbox_material_enable_italic = 1
	  let g:gruvbox_material_enable_bold = 1
	  let g:gruvbox_material_better_performance = 1
	]])
	vim.cmd.colorscheme("gruvbox-material")
end

return M

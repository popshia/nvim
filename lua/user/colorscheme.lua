vim.cmd([[
  let g:gruvbox_material_palette = 'mix'
  let g:gruvbox_material_statusline_style = 'mix'
  let g:gruvbox_material_enable_italic = 1
  let g:gruvbox_material_enable_bold = 1
  let g:gruvbox_material_better_performance = 1
]])

local colorscheme = "gruvbox-material"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

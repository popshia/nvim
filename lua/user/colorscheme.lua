vim.cmd([[
try
  let g:gruvbox_material_palette = 'mix'
  let g:gruvbox_material_enable_italic = 1
  let g:gruvbox_material_enable_bold = 1
  colorscheme gruvbox-material
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

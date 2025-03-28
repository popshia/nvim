-- :help options
local opt = vim.opt

opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 0 -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.pumheight = 10 -- pop up menu height
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 0 -- always show tabs
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.autoindent = true -- make indenting same as line above
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 250 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = false -- convert tabs to spaces
opt.cursorline = true -- highlight the current line
opt.number = true -- set numbered lines
opt.relativenumber = true -- set relative numbered lines
opt.laststatus = 3 -- set global status bar
opt.showcmd = false -- don't show commands
opt.ruler = false -- disable ruler
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
opt.tabstop = 4 -- insert 4 spaces for a tab
opt.scrolloff = 8 -- vertical scrolloff with 8 char
opt.sidescrolloff = 8 -- horizontal scrolloff with 8 char
opt.foldenable = false -- code folding
opt.mousemoveevent = true -- mouse scrolling
opt.background = "dark" -- dark mode theme
-- opt.winborder = "rounded" -- use rounded borders on all floating windows

opt.shortmess:append("c")
opt.whichwrap:append("<,>,[,],h,l")
-- opt.iskeyword:append("-")
opt.iskeyword:remove("_")

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function map(mode, keys, func, desc)
	vim.keymap.set(mode, keys, func, { desc = desc, noremap = true, silent = true })
end

map("", "<Space>", "<Nop>", "Clear Space Keymapping")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear Highlighting")

map("n", "<C-h>", "<C-w>h", "Focus Left")
map("n", "<C-j>", "<C-w>j", "Focus Down")
map("n", "<C-k>", "<C-w>k", "Focus Up")
map("n", "<C-l>", "<C-w>l", "Focus Right")

map("n", "<C-Up>", ":resize +2<CR>", "Horizontal+")
map("n", "<C-Down>", ":resize -2<CR>", "Horizontal-")
map("n", "<C-->", ":vertical resize -2<CR>", "Vertical-")
map("n", "<C-+>", ":vertical resize +2<CR>", "Vertical+")

map("v", "p", [["_dp]])

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "J", ":m .+1<CR>==", "Move Line Down")
map("n", "K", ":m .-2<CR>==", "Move Line Up")
map("v", "J", ":m .+1<CR>==", "Move Line Down")
map("v", "K", ":m .-2<CR>==", "Move Line Up")
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

map({ "n", "o", "x" }, "<C-m>", "^", "Move Cursor to Line Start")
map({ "n", "o", "x" }, "<C-/>", "g_", "Move Cursor to Line End")

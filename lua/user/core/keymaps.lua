local function map(mode, keys, func, desc)
	vim.keymap.set(mode, keys, func, { desc = desc, noremap = true, silent = true })
end

local discipline = require("user.utils.discipline")
discipline.cowboy()

map("", "<Space>", "<Nop>", "Clear Space Keymapping")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear Highlighting")

-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",
-- operator_mode = "c",

map("n", "<C-h>", "<C-w>h", "Focus Left")
map("n", "<C-j>", "<C-w>j", "Focus Down")
map("n", "<C-k>", "<C-w>k", "Focus Up")
map("n", "<C-l>", "<C-w>l", "Focus Right")

map("n", "<C-Up>", ":resize +2<CR>", "Horizontal+")
map("n", "<C-Down>", ":resize -2<CR>", "Horizontal-")
map("n", "<C-->", ":vertical resize -2<CR>", "Vertical-")
map("n", "<C-+>", ":vertical resize +2<CR>", "Vertical+")

map("n", "L", ":bnext<CR>", "Next Buffer")
map("n", "H", ":bprevious<CR>", "Previous Buffer")

map("v", "p", [["_dp]])

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "J", ":m .+1<CR>==", "Move Line Down")
map("n", "K", ":m .-2<CR>==", "Move Line Up")
map("v", "J", ":m .+1<CR>==", "Move Line Down")
map("v", "K", ":m .-2<CR>==", "Move Line Up")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Substitute Current Word")

vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
map("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")

map({ "n", "o", "x" }, "<C-m>", "^", "Move Cursor to Line Start")
map({ "n", "o", "x" }, "<C-/>", "g_", "Move Cursor to Line End")

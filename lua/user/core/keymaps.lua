-- local discipline = require("user.utils.discipline")
-- discipline.cowboy()

function map(mode, keys, func, desc)
	vim.keymap.set(mode, keys, func, { desc = desc, noremap = true, silent = true })
end

-- Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   operator_mode = "c",

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-->", ":vertical resize -2<CR>")
map("n", "<C-+>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "L", ":bnext<CR>")
map("n", "H", ":bprevious<CR>")

-- Paste without yanking
map("v", "p", [["_dp]])

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "J", ":m .+1<CR>==")
map("v", "K", ":m .-2<CR>==")
map("n", "J", ":m .+1<CR>==")
map("n", "K", ":m .-2<CR>==")

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

-- Substitute
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Mousemenu
vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
map("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
-- map("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- Move cursor to the start or the end
-- map({ "n", "o", "x" }, "H", "^")
-- map({ "n", "o", "x" }, "L", "g_")

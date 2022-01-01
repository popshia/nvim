local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local map = vim.api.nvim_set_keymap

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Move text up and down
-- map("n", "∆", "<Esc>:m .+1<CR>==gi", opts)
-- map("n", "˚", "<Esc>:m .-2<CR>==gi", opts)

-- Paste without yanking
map("v", "p", '"_dp', opts)

-- Insert --
-- Press jk fast to enter
map("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "J", ":m .+1<CR>==", opts)
map("v", "K", ":m .-2<CR>==", opts)
map("n", "J", ":m .+1<CR>==", opts)
map("n", "K", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Hop.nvim
map("n", "f", "<cmd>HopWord<cr>", opts)
map("n", "F", "<cmd>HopLine<cr>", opts)

-- Sniprun.nvim
map("n", "<C-r>", "<cmd>Sniprun<cr>", opts)
map("v", "<C-r>", "<cmd>Sniprun<cr>", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

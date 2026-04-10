-- keymaps

-- Global mapping function ====================================================
function _G.map(mode, keys, func, desc, expr)
   vim.keymap.set(mode, keys, func, { desc = desc, expr = expr })
end

-- Remove space keymapping ====================================================
map("", "<Space>", "<Nop>")
vim.keymap.del({ "i", "s" }, "<Tab>")
vim.keymap.del({ "i", "s" }, "<S-Tab>")

-- Window/Buffer navigation/resizing ==========================================
map("n", "<C-h>", "<C-w>h", "Focus Left")
map("n", "<C-j>", "<C-w>j", "Focus Down")
map("n", "<C-k>", "<C-w>k", "Focus Up")
map("n", "<C-l>", "<C-w>l", "Focus Right")
map("n", "<C-Up>", ":resize +2<CR>", "Horizontal+")
map("n", "<C-Down>", ":resize -2<CR>", "Horizontal-")
map("n", "<C-->", ":vertical resize -2<CR>", "Vertical-")
map("n", "<C-+>", ":vertical resize +2<CR>", "Vertical+")
map("n", "H", ":bprev<CR>", "Previous buffer")
map("n", "L", ":bnext<CR>", "Next buffer")

-- Editing ====================================================================
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "p", [["_dp]], "Paste without yanking")
map("n", "cp", "p`[v`]", "Paste and reindent")
map("n", "J", ":m .+1<CR>==", "Move Line Down")
map("n", "K", ":m .-2<CR>==", "Move Line Up")
map("v", "J", ":m .+1<CR>==", "Move Line Down")
map("v", "K", ":m .-2<CR>==", "Move Line Up")
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "/", "<Esc>/\\%V", "Search within visual selection")

-- Cursor navigation ==========================================================
map({ "n", "x" }, "gh", "^", "Move Cursor to Line Start")
map({ "n", "x" }, "gl", "g_", "Move Cursor to Line End")

-- Comment and yank paste =====================================================
map("n", "ycc", "yy<Plug>(comment_toggle_linewise_current)p", "Duplicate and comment line")
map("x", "ycc", "ygv<Plug>(comment_toggle_linewise_visual)`>p", "Duplicate and comment line")

-- Undo tree ==================================================================
map("n", "<leader>su", function()
   require("undotree").open({ command = "40vnew" })
end, "Search Undo History")

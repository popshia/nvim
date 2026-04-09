-- :help options

-- stylua: ignore start
-- General ====================================================================
vim.g.mapleader          = " "  -- Use `<Space>` as <Leader> key
vim.g.maplocalleader     = " "
vim.o.mouse              = "a"  -- allow the mouse to be used in neovim
vim.o.mousemoveevent     = true -- mouse scrolling
vim.o.timeoutlen         = 400  -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.updatetime         = 2000 -- faster completion (4000ms default)
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- UI =========================================================================
vim.o.cursorline         = true   -- highlight the current line
vim.o.number             = true   -- set numbered lines
vim.o.relativenumber     = true   -- set relative numbered lines
vim.o.ruler              = false  -- disable ruler
vim.o.signcolumn         = "yes"  -- always show the sign column, otherwise it would shift the text each time
vim.o.cmdheight          = 0      -- more space in the neovim command line for displaying messages
vim.o.conceallevel       = 0      -- so that `` is visible in markdown files
vim.o.pumheight          = 10     -- pop up menu height
vim.o.showmode           = false  -- we don't need to see things like -- INSERT -- anymore
vim.o.showtabline        = 0      -- always show tabs
vim.o.splitbelow         = true   -- force all horizontal splits to go below current window
vim.o.splitright         = true   -- force all vertical splits to go to the right of current window
vim.o.termguicolors      = true   -- set term gui colors (most terminals support this)
vim.o.background         = "dark" -- dark mode theme
vim.o.expandtab          = false  -- convert tabs to spaces
vim.o.laststatus         = 0      -- set global status bar
vim.o.showcmd            = false  -- don't show commands
vim.o.scrolloff          = 8      -- vertical scrolloff with 8 char
vim.o.sidescrolloff      = 8      -- horizontal scrolloff with 8 char
vim.o.wrap               = false  -- display lines as one long line
vim.opt.shortmess:append("c")

-- Editing ====================================================================
vim.o.autoindent    = true               -- make indenting same as line above
vim.o.smartcase     = true               -- smart case
vim.o.smartindent   = true               -- make indenting smarter again
vim.o.ignorecase    = true               -- ignore case in search patterns
vim.o.incsearch     = true               -- Show search matches while typing
vim.o.shiftwidth    = 4                  -- the number of spaces inserted for each indentation
vim.o.tabstop       = 2                  -- insert 2 spaces for a tab
vim.o.numberwidth   = 4                  -- set number column width to 2 {default 4}
vim.o.clipboard     = "unnamedplus"      -- allows neovim to access the system clipboard
vim.o.hlsearch      = true               -- highlight all matches on previous search pattern
vim.o.backup        = false              -- creates a backup file
vim.o.swapfile      = false              -- creates a swapfile
vim.o.undofile      = true               -- enable persistent undo
vim.o.writebackup   = false              -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.foldenable    = false              -- code folding
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:remove("_")
-- vim.opt.iskeyword:append("-")
-- stylua: ignore end

-- Diagnostics ================================================================
local diagnostic_opts = {
   -- virtual_lines = { current_line = true },
   -- virtual_text = { current_line = false },
   -- virtual_lines = false,
   -- virtual_text = false,
   -- update_in_insert = false,
   -- severity_sort = true,
   -- float = {
   --    focusable = true,
   --    style = "minimal",
   --    source = true,
   --    header = "",
   --    prefix = "",
   -- },
   signs = {
      text = {
         [vim.diagnostic.severity.ERROR] = "",
         [vim.diagnostic.severity.WARN] = "",
         [vim.diagnostic.severity.HINT] = "",
         [vim.diagnostic.severity.INFO] = "",
      },
   },
}

later(function()
   vim.diagnostic.config(diagnostic_opts)
end)

-- ui2 ========================================================================
-- require("vim._core.ui2").enable({
--    enable = true,
--    msg = {
--       targets = {
--          [""] = "msg",
--          empty = "cmd",
--          bufwrite = "msg",
--          confirm = "cmd",
--          emsg = "pager",
--          echo = "msg",
--          echomsg = "msg",
--          echoerr = "pager",
--          completion = "cmd",
--          list_cmd = "pager",
--          lua_error = "pager",
--          lua_print = "msg",
--          progress = "pager",
--          rpc_error = "pager",
--          quickfix = "msg",
--          search_cmd = "cmd",
--          search_count = "cmd",
--          shell_cmd = "pager",
--          shell_err = "pager",
--          shell_out = "pager",
--          shell_ret = "msg",
--          undo = "msg",
--          verbose = "pager",
--          wildlist = "cmd",
--          wmsg = "msg",
--          typed_cmd = "cmd",
--       },
--       cmd = {
--          height = 0.5,
--       },
--       dialog = {
--          height = 0.5,
--       },
--       msg = {
--          height = 0.6,
--          timeout = 5000,
--       },
--       pager = {
--          height = 0.5,
--       },
--    },
-- })

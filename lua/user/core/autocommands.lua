-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
   pattern = { "qf", "help", "man", "lspinfo", "oil" },
   callback = function()
      vim.cmd([[
			nnoremap <silent> <buffer> q :close<CR>
			set nobuflisted
		]])
   end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
   pattern = { "AlphaReady" },
   callback = function()
      vim.cmd([[
			set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
			set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
		]])
   end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
   pattern = { "gitcommit", "markdown" },
   callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.spell = true
   end,
})

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
   callback = function() vim.cmd("set formatoptions-=cro") end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
   callback = function() vim.highlight.on_yank() end,
})

-- Toggle relative number between normal and insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
   callback = function() vim.opt.relativenumber = false end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
   callback = function() vim.opt.relativenumber = true end,
})

-- better winbar symbol performance
vim.api.nvim_create_autocmd({
   "WinResized", -- or WinResized on NVIM-v0.9 and higher
   "BufWinEnter",
   "CursorHold",
   "InsertLeave",
}, {
   group = vim.api.nvim_create_augroup("barbecue.updater", {}),
   callback = function() require("barbecue.ui").update() end,
})

-- lsp progress
vim.api.nvim_create_autocmd("LspProgress", {
   ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
   callback = function(ev)
      local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
      vim.notify(vim.lsp.status(), "info", {
         id = "lsp_progress",
         title = "LSP Progress",
         opts = function(notif) notif.icon = ev.data.params.value.kind == "end" and " " or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1] end,
      })
   end,
})

-- oil rename
vim.api.nvim_create_autocmd("User", {
   pattern = "OilActionsPost",
   callback = function(event)
      if event.data.actions.type == "move" then Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url) end
   end,
})

-- htmldjango files
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
-- 	pattern = { "*.html" },
-- 	callback = function()
-- 		vim.cmd("setfiletype htmldjango")
-- 	end,
-- })

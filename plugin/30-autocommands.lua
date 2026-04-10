-- Use 'q' to quit from common plugins
new_autocmd("FileType", { "qf", "help", "man", "oil", "nvim-undotree" }, false, function()
   vim.cmd([[
			nnoremap <silent> <buffer> q :close<CR>
			set nobuflisted
		]])
end)

-- Set wrap and spell in markdown and gitcommit
new_autocmd("FileType", { "gitcommit", "markdown" }, false, function()
   vim.opt_local.wrap = true
   vim.opt_local.spell = true
end)

-- Fixes Autocomment
new_autocmd("Filetype", nil, false, function()
   vim.cmd("set formatoptions-=cro")
end)

-- Highlight Yanked Text
new_autocmd("TextYankPost", nil, false, function()
   vim.highlight.on_yank()
end)

-- Toggle relative number between normal and insert mode
new_autocmd("InsertEnter", nil, false, function()
   vim.opt.relativenumber = false
end)
new_autocmd("InsertLeave", nil, false, function()
   vim.opt.relativenumber = true
end)

-- oil rename
new_autocmd("User", "OilActionPost", false, function(event)
   if event.data.actions.type == "move" then
      Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
   end
end, "Oil rename")

-- auto refresh file in swift
new_autocmd("FileType", { "swift" }, false, function()
   vim.opt.autoread = true
   vim.fn.timer_start(2000, function()
      vim.cmd("silent! checktime")
   end, { ["repeat"] = -1 })
end, "Auto refresh on Swift files")

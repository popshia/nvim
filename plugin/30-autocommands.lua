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

-- lsp progress
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
new_autocmd("LspProgress", "", false, function(ev)
   local client = vim.lsp.get_client_by_id(ev.data.client_id)
   local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
   if not client or type(value) ~= "table" then
      return
   end
   local p = progress[client.id]

   for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
         p[i] = {
            token = ev.data.params.token,
            msg = ("[%3d%%] %s%s"):format(
               value.kind == "end" and 100 or value.percentage or 100,
               value.title or "",
               value.message and (" **%s**"):format(value.message) or ""
            ),
            done = value.kind == "end",
         }
         break
      end
   end

   local msg = {} ---@type string[]
   progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
   end, p)

   local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
   vim.notify(table.concat(msg, "\n"), "info", {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
         notif.icon = #progress[client.id] == 0 and " "
            or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
   })
end, "Lsp progress")

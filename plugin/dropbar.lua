-- IDE-like breadcrumbs, out of the box

vim.pack.add({ "https://github.com/Bekaboo/dropbar.nvim" })

require("keymaps")
map("n", "<leader>f;", function()
   require("dropbar.api").pick()
end, "Pick Symbols In Winbar")
map("n", "[;", function()
   require("dropbar.api").goto_context_start()
end, "Go To Start Of Current Context")
map("n", "];", function()
   require("dropbar.api").select_next_context()
end, "Select Next Context")

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
   pattern = "*",
   callback = function()
      vim.pack.add({ "https://github.com/bekaboo/dropbar.nvim" })
      require("dropbar").setup({
         bar = {
            sources = function(buf, _)
               local sources = require("dropbar.sources")
               local utils = require("dropbar.utils")
               if vim.bo[buf].ft == "markdown" then
                  return {
                     -- sources.path,
                     utils.source.fallback({
                        sources.markdown,
                     }),
                  }
               end
               if vim.bo[buf].buftype == "terminal" then
                  return {
                     sources.terminal,
                  }
               end
               return {
                  -- sources.path,
                  utils.source.fallback({
                     sources.lsp,
                     sources.treesitter,
                  }),
               }
            end,
         },
      })
   end,
})

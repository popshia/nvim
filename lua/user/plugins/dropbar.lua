-- IDE-like breadcrumbs, out of the box

return {
   "Bekaboo/dropbar.nvim",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
   },
   keys = {
      { "<leader>;", function() require("dropbar.api").pick() end, desc = "Pick symbols in winbar" },
      { "[;", function() require("dropbar.api").goto_context_start() end, desc = "Go to start of current context" },
      { "];", function() require("dropbar.api").select_next_context() end, desc = "Select next context" },
   },
   config = {
      bar = {
         sources = function(buf, _)
            local sources = require("dropbar.sources")
            local utils = require("dropbar.utils")
            if vim.bo[buf].ft == "markdown" then return {
               sources.path,
               sources.markdown,
            } end
            if vim.bo[buf].buftype == "terminal" then return {
               sources.terminal,
            } end
            return {
               -- sources.path,
               utils.source.fallback({
                  sources.lsp,
                  sources.treesitter,
               }),
            }
         end,
      },
   },
}

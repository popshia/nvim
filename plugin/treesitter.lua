-- nvim-treesitter

now_if_args(function()
   vim.pack.add({
      gh("nvim-treesitter/nvim-treesitter"),
      gh("nvim-treesitter/nvim-treesitter-textobjects"),
   })

   -- Define languages which will have parsers installed and auto enabled
   -- After changing this, restart Neovim once to install necessary parsers. Wait
   -- for the installation to finish before opening a file for added language(s).
   local languages = {
      "css",
      "diff",
      "fish",
      "gitcommit",
      "gitignore",
      "html",
      "json",
      "javascript",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "swift",
      "toml",
      "vimdoc",
      "vue",
      "yaml",
   }
   local isnt_installed = function(lang)
      return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
   end
   local to_install = vim.tbl_filter(isnt_installed, languages)
   if #to_install > 0 then
      require("nvim-treesitter").install(to_install)
   end

   -- Enable tree-sitter after opening a file for a target language
   local filetypes = {}
   for _, lang in ipairs(languages) do
      for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
         table.insert(filetypes, ft)
      end
   end
   local ts_start = function(ev)
      vim.treesitter.start(ev.buf)
   end
   new_autocmd("FileType", filetypes, false, ts_start, "Start tree-sitter")

   -- Define hook to update tree-sitter parsers after plugin is updated
   on_packchanged("nvim-treesitter", { "update" }, function()
      vim.cmd("TSUpdate")
   end, ":TSUpdate")
end)

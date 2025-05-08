-- treesitter for syntax highlighting and symbol recognition

return {
   "nvim-treesitter/nvim-treesitter",
   dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
   },
   build = ":TSUpdate",
   opts = {
      ensure_installed = {
         "bash",
         "c",
         "comment",
         "css",
         "cpp",
         "comment",
         "fish",
         "gitconfig",
         "gitcommit",
         "gitignore",
         "html",
         "htmldjango",
         "javascript",
         "lua",
         "markdown",
         "markdown_inline",
         "python",
         "svelte",
         "toml",
         "vim",
         "vimdoc",
         "xml",
         "yaml",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
   },
}

-- file formatting

return {
   "stevearc/conform.nvim",
   event = "BufWritePre",
   keys = {
      { "<leader>ff", function() require("conform").format() end, desc = "File Format" },
   },
   opts = {
      formatters_by_ft = {
         cpp = { "clang_format" },
         lua = { "stylua" },
         python = { "isort", "black" },
         shell = { "shfmt", "shellcheck" },
         fish = { "fish_indent" },
         json = { "prettier" },
         html = { "prettier" },
         javascript = { "prettier" },
         svelte = { "prettier" },
         yaml = { "prettier" },
         ["*"] = { "trim_whitespace", "codespell" },
         ["_"] = {},
      },
      formatters = {
         black = {
            prepend_args = { "--fast" },
         },
         isort = {
            prepend_args = { "--profile", "black" },
         },
         clang_foramt = {
            prepend_args = { "--style=LLVM" },
         },
      },
      format_on_save = {
         timeout_ms = 500,
         lsp_fallback = true,
      },
   },
}

-- file formatting

return {
   "stevearc/conform.nvim",
   event = "BufWritePre",
   cmd = "ConformInfo",
   keys = {
      {
         "<leader>ff",
         function()
            require("conform").format()
         end,
         desc = "File Format",
      },
   },
   ---@module "conform"
   ---@type conform.setupOpts
   opts = {
      formatters_by_ft = {
         cpp = { "clang_format" },
         lua = { "stylua" },
         python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
         shell = { "shfmt", "shellcheck" },
         fish = { "fish_indent" },
         json = { "prettier" },
         html = { "prettier" },
         javascript = { "prettier" },
         svelte = { "prettier" },
         yaml = { "prettier" },
         swift = { "swiftformat" },
         ["*"] = { "trim_whitespace", "codespell" },
         ["_"] = {},
      },
      formatters = {
         clang_foramt = {
            prepend_args = { "--style=LLVM" },
         },
         injected = {
            option = { ignore_errors = true },
         },
      },
      format_on_save = {
         timeout_ms = 500,
         lsp_fallback = true,
      },
   },
}

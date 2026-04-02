-- file formatting

later(function()
   vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

   require("conform").setup({
      ---@module "conform"
      ---@type conform.setupOpts
      formatters_by_ft = {
         lua = { "stylua" },
         python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
         shell = { "shfmt", "shellcheck" },
         fish = { "fish_indent" },
         json = { "prettier" },
         html = { "prettier" },
         javascript = { "prettier" },
         yaml = { "prettier" },
         swift = { "swift" },
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
         stylua = {
            append_args = {
               "--indent-type",
               "Spaces",
               "--indent-width",
               "3",
               "--column-width",
               "120",
            },
         },
         swift = {
            -- Prepend the configuration flag to point to your local file
            append_args = { "--configuration", "~/.swift-format.json" },
         },
      },
      format_on_save = {
         timeout_ms = 500,
         lsp_format = "fallback",
      },
   })
end)

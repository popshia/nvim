return {
   "rachartier/tiny-inline-diagnostic.nvim",
   event = "VeryLazy",
   priority = 1000,
   config = function()
      require("tiny-inline-diagnostic").setup({
         -- Style preset for diagnostic messages
         -- Available options:
         -- "modern", "classic", "minimal",
         -- "simple", "nonerdfont", "powerline"
         preset = "modern",
         transparent_bg = false,
         options = {
            severity = {
               vim.diagnostic.severity.WARN,
               vim.diagnostic.severity.INFO,
               vim.diagnostic.severity.HINT,
            },
         },
      })
      vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
   end,
}

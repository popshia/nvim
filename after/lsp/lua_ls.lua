return {
   settings = {
      Lua = {
         runtime = { version = "LuaJIT" },
         format = { enable = false },
         diagnostics = {
            globals = { "vim", "hs" },
         },
         workspace = {
            library = {
               "${3rd}/luv/library",
               unpack(vim.api.nvim_get_runtime_file("", true)),
               vim.env.VIMRUNTIME,
            },
         },
         completion = { callSnippet = "Replace" },
         telemetry = { enable = false },
         hint = { enable = true },
      },
   },
}

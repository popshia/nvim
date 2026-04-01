return {
   settings = {
      Lua = {
         runtime = { version = "LuaJIT" },
         format = { enable = false },
         diagnostics = {
            globals = { "vim", "hs" },
         },
         workspace = {
            ignoreSubmodules = true,
            library = {
               vim.env.VIMRUNTIME,
            },
         },
         completion = { callSnippet = "Replace" },
         telemetry = { enable = false },
         hint = { enable = true },
      },
   },
}

return {
   cmd = { "lua-language-server" },
   filetypes = { "lua" },
   root_markers = { ".git/", ".stylua.toml" },
   settings = {
      Lua = {
         runtime = { version = "LuaJIT" },
         format = { enable = false },
         diagnostics = {
            globals = { "vim" },
            disable = { "missing-fields" },
         },
         workspace = {
            library = {
               "${3rd}/luv/library",
               unpack(vim.api.nvim_get_runtime_file("", true)),
            },
         },
         completion = { callSnippet = "Replace" },
         telemetry = { enable = false },
         hint = { enable = true },
      },
   },
}

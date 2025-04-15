return {
   cmd = { "clangd", "--offset-encoding=utf-16" },
   InlayHints = {
      Designators = true,
      Enabled = true,
      ParameterNames = true,
      DeducedTypes = true,
   },
   fallbackFlags = { "-std=c++20" },
}

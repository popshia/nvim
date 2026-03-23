return {
   settings = {
      basedpyright = {
         disableOrganizeImports = true,
         analysis = {
            autoImportCompletions = true,
            typeCheckingMode = "basic",
            diagnosticMode = "openFilesOnly",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            inlayHints = {
               variableTypes = true,
               functionReturnTypes = true,
               callArgumentNames = true,
            },
         },
      },
   },
}

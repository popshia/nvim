return {
   settings = {
      typescript = {
         inlayHints = {
            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayVariableTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
         },
      },
      javascript = {
         inlayHints = {
            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayVariableTypeHints = true,

            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
         },
      },
   },
}

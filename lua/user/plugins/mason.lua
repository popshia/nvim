-- mason

return {
   "williamboman/mason.nvim",
   cmd = "Mason",
   keys = {
      { "<leader>ms", "<cmd>Mason<CR>", desc = "Mason" },
   },
   dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
   },
   config = function()
      -- lsp server configs
      local servers = {
         clangd = {
            cmd = { "clangd", "--offset-encoding=utf-16" },
            InlayHints = {
               Designators = true,
               Enabled = true,
               ParameterNames = true,
               DeducedTypes = true,
            },
            fallbackFlags = { "-std=c++20" },
         },
         lua_ls = {
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
         },
         basedpyright = {
            settings = {
               basedpyright = {
                  disableOrganizeImports = true,
                  analysis = {
                     autoImportCompletions = true,
                     typeCheckingMode = "off",
                     diagnosticMode = "openFilesOnly",
                     autoSearchPaths = true,
                     useLibraryCodeForTypes = true,
                  },
               },
            },
         },
         html = {
            filetypes = { "html", "htmldjango" },
         },
         tailwindcss = {},
         bashls = {},
         ts_ls = {
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
         },
      }

      require("mason").setup({
         ui = {
            border = "rounded",
            icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" },
         },
      })

      local ensure_install_servers = vim.tbl_keys(servers)
      vim.list_extend(ensure_install_servers, {
         "basedpyright",
         "bash-language-server",
         "black",
         "clang-format",
         "clangd",
         "codespell",
         "eslint-lsp",
         "html-lsp",
         "isort",
         "lua-language-server",
         "marksman",
         "prettier",
         "shfmt",
         "stylua",
         "svelte-language-server",
         "tailwindcss-language-server",
         "typescript-language-server",
      })

      require("mason-tool-installer").setup({ ensure_installed = ensure_install_servers })

      require("mason-lspconfig").setup({
         handlers = {
            function(server_name)
               local server = servers[server_name] or {}
               server.on_attach = function(client, bufnr)
                  require("lsp_signature").on_attach({
                     floating_window = false,
                     hint_prefix = " ",
                  }, bufnr)

                  -- show inlay hint in visual mode and hide in insert mode
                  if client.server_capabilities.inlayHintProvider then
                     vim.api.nvim_create_autocmd({ "InsertEnter" }, {
                        callback = function()
                           vim.lsp.inlay_hint.enable(true)
                        end,
                     })
                     vim.api.nvim_create_autocmd({ "InsertLeave" }, {
                        callback = function()
                           vim.lsp.inlay_hint.enable(false)
                        end,
                     })
                  end
               end
               server.capabilities = require("blink.cmp").get_lsp_capabilities()
               require("lspconfig")[server_name].setup(server)
            end,
         },
         automatic_installation = true,
      })
   end,
}

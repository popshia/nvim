-- lsp keymaps and other configs

return {
   "neovim/nvim-lspconfig",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   dependencies = {
      { "folke/lazydev.nvim", ft = "lua", opts = {} },
      { "ray-x/lsp_signature.nvim", opts = {} },
      { "williamboman/mason.nvim", opts = {}, cmd = "Mason" },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
   },
   keys = {
      { "gd", "<cmd>Trouble lsp_definitions<CR>", desc = "Goto Definition" },
      { "gr", "<cmd>Trouble lsp_references<CR>", desc = "Goto Reference" },
      { "gi", "<cmd>Trouble lsp_implementations<CR>", desc = "Goto Implementation" },
      { "gk", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover Documentation" },
      { "gj", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open Float" },
      { "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
      { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
      { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions" },
      { "<leader>li", "<cmd>LspInfo<CR>", desc = "LSP Info" },
      { "<leader>ms", "<cmd>Mason<CR>", desc = "Mason" },
   },
   config = function()
      -- diagnostic configs
      vim.diagnostic.config({
         virtual_lines = { current_line = true },
         virtual_text = false,
         update_in_insert = true,
         severity_sort = true,
         float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = true,
            header = "",
            prefix = "",
         },
      })

      -- icons configs
      local signs = {
         Error = "",
         Warn = "",
         Hint = "󰌵",
         Info = "",
      }
      for type, icon in pairs(signs) do
         local diagnostic_type = "DiagnosticSign" .. type
         vim.fn.sign_define(diagnostic_type, { text = icon, texthl = diagnostic_type, numhl = diagnostic_type })
      end

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
                     hint_prefix = "󰋼 ",
                  }, bufnr)

                  -- show inlay hint in visual mode and hide in insert mode
                  if client.server_capabilities.inlayHintProvider then
                     vim.api.nvim_create_autocmd({ "InsertEnter" }, {
                        callback = function() vim.lsp.inlay_hint.enable(true) end,
                     })
                     vim.api.nvim_create_autocmd({ "InsertLeave" }, {
                        callback = function() vim.lsp.inlay_hint.enable(false) end,
                     })
                  end
               end
               -- server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities)
               require("lspconfig")[server_name].setup(server)
            end,
         },
         automatic_installation = true,
      })
   end,
}

-- autocomplete

return {
   "saghen/blink.cmp",
   event = {
      "CmdlineEnter",
      "BufReadPost",
      "BufNewFile",
   },
   dependencies = {
      {
         "L3MON4D3/LuaSnip",
         version = "v2.*",
         build = "make install_jsregexp",
         dependencies = {
            {
               "rafamadriz/friendly-snippets",
               config = function()
                  require("luasnip.loaders.from_vscode").lazy_load()
                  require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
               end,
            },
         },
      },
   },
   version = "*",
   ---@module 'blink.cmp'
   ---@type blink.cmp.Config
   opts = {
      keymap = {
         preset = "enter",
         ["<Tab>"] = {},
         ["<S-Tab>"] = {},
         ["<C-e>"] = {},
         ["<C-a>"] = { "hide", "fallback" },
         ["<C-l>"] = { "snippet_forward", "fallback" },
         ["<C-h>"] = { "snippet_backward", "fallback" },
      },
      cmdline = {
         keymap = {
            ["<CR>"] = { "accept_and_enter", "fallback" },
         },
         completion = {
            menu = { auto_show = true },
            list = {
               selection = { preselect = false, auto_insert = true },
            },
         },
      },
      appearance = {
         use_nvim_cmp_as_default = true,
         nerd_font_variant = "mono",
      },
      sources = {
         default = { "lazydev", "lsp", "snippets", "path", "buffer" },
         providers = {
            cmdline = {
               min_keyword_length = function(ctx)
                  if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then return 3 end
                  return 0
               end,
            },
            lazydev = {
               name = "LazyDev",
               module = "lazydev.integrations.blink",
               score_offset = 100,
            },
            lsp = { score_offset = 80 },
            snippets = { score_offset = 80 },
            path = { score_offset = 60 },
            buffer = { score_offset = 40 },
         },
      },
      signature = {
         enabled = true,
         window = { show_documentation = false },
      },
      completion = {
         keyword = { range = "full" },
         menu = {
            draw = {
               -- We don't need label_description now because label and label_description are already
               -- combined together in label by colorful-menu.nvim.
               columns = { { "kind_icon" }, { "label", gap = 1 } },
               components = {
                  label = {
                     text = function(ctx) return require("colorful-menu").blink_components_text(ctx) end,
                     highlight = function(ctx) return require("colorful-menu").blink_components_highlight(ctx) end,
                  },
               },
            },
         },
         documentation = {
            auto_show = true,
            window = { border = "rounded" },
         },
      },
      snippets = {
         expand = function(snippet) require("luasnip").lsp_expand(snippet) end,
         active = function(filter)
            if filter and filter.direction then return require("luasnip").jumpable(filter.direction) end
            return require("luasnip").in_snippet()
         end,
         jump = function(direction) require("luasnip").jump(direction) end,
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
   },
   opts_extend = { "sources.default" },
}

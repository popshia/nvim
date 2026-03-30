-- autocomplete

vim.pack.add({
   { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "InsertEnter" }, {
   once = true,
   callback = function()
      vim.pack.add({ "https://github.com/L3MON4D3/LuaSnip", "https://github.com/rafamadriz/friendly-snippets" })
      require("blink-cmp").setup({
         ---@module 'blink.cmp'
         ---@type blink.cmp.Config
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
                     if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
                        return 3
                     end
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
            enabled = false,
            window = { show_documentation = false },
         },
         completion = {
            keyword = { range = "full" },
            menu = {
               draw = {
                  columns = {
                     { "kind_icon" },
                     { "label", "label_description", gap = 1 },
                     { "kind" },
                     -- { "source_name" },
                  },
               },
            },
            documentation = {
               auto_show = true,
               window = { border = "rounded" },
               auto_show_delay_ms = 500,
            },
         },
         snippets = {
            expand = function(snippet)
               require("luasnip").lsp_expand(snippet)
            end,
            active = function(filter)
               if filter and filter.direction then
                  return require("luasnip").jumpable(filter.direction)
               end
               return require("luasnip").in_snippet()
            end,
            jump = function(direction)
               require("luasnip").jump(direction)
            end,
         },
         fuzzy = { implementation = "prefer_rust_with_warning" },
      })
   end,
})

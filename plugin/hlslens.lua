-- show search count using "/"

Config.now_if_args(function()
   vim.pack.add({ "https://github.com/kevinhwang91/nvim-hlslens" })

   Config.new_autocmd("CmdlineEnter", nil, true, function()
      -- keymaps
      map("n", "n", function()
         vim.cmd("normal!" .. vim.v.count1 .. "n")
         vim.api.nvim_feedkeys("zz", "n", false)
         require("hlslens").start()
      end, "Next Hlslens Search")
      map("n", "N", function()
         vim.cmd("normal!" .. vim.v.count1 .. "N")
         vim.api.nvim_feedkeys("zz", "n", false)
         require("hlslens").start()
      end, "Previous Hlslens Search")
      map("n", "*", function()
         vim.api.nvim_feedkeys("*zz", "n", false)
         require("hlslens").start()
      end)
      map("n", "#", function()
         vim.api.nvim_feedkeys("#zz", "n", false)
         require("hlslens").start()
      end)
      map("n", "g*", function()
         vim.api.nvim_feedkeys("g*zz", "n", false)
         require("hlslens").start()
      end)
      map("n", "g#", function()
         vim.api.nvim_feedkeys("g#zz", "n", false)
         require("hlslens").start()
      end)

      -- setup
      require("hlslens").setup({
         opts = {
            calm_down = true,
            nearest_only = true,
            nearest_float_when = "auto",
         },
      })
   end)
end)

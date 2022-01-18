-- Impatient
require("impatient")
require("packer_compiled")

-- General
require("user.autocommands")
require("user.colorscheme")
require("user.keymaps")
require("user.options")

-- Packer
require("user.plugins")

-- Plugin configs
require("user.alpha")
require("user.autopairs")
require("user.bufferline")
require("user.cmp")
require("user.comment")
require("user.gitsigns")
require("user.hlslens")
require("user.hop")
require("user.indentline")
require("user.lualine")
require("user.neoscroll")
require("user.nvim-tree")
require("user.project")
require("user.telescope")
require("user.toggleterm")
require("user.treesitter")
require("user.whichkey")

-- LSP folder
require("user.lsp")

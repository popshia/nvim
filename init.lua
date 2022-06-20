-- impatent.nvim
require("impatient")

-- user configuration
require("user.autocommands")
require("user.colorscheme")
require("user.keymaps")
require("user.options")

-- packer
require("user.plugins")

-- plugins
require("user.alpha")
require("user.bufferline")
require("user.cinnamon")
require("user.cmp")
require("user.comment")
require("user.gitsigns")
require("user.hlslens")
require("user.hop")
require("user.indentline")
require("user.jaq")
require("user.lualine")
require("user.notify")
require("user.nvim-colorizer")
require("user.nvim-tree")
require("user.project")
require("user.smart-pairs")
require("user.sniprun")
require("user.surround")
require("user.telescope")
require("user.toggleterm")
require("user.treesitter-context")
require("user.treesitter")
require("user.whichkey")

-- lsp config folder
require("lsp")

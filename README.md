## Screenshots

![Screen Shot 2022-05-17 at 22 38 46](https://user-images.githubusercontent.com/3250328/168838112-77e27fca-3d7d-4b28-8291-a2ca1dbacaa5.png)
![Screen Shot 2022-05-17 at 22 40 27](https://user-images.githubusercontent.com/3250328/168838508-fee2c082-aee7-4a2e-a9c0-9bb103fa8a6e.png)

## Requirements

- [Neovim](https://github.com/neovim/neovim) -- version > 0.7
- [NodeJS](https://nodejs.org)
- [Lazygit](https://github.com/jesseduffield/lazygit) -- for git integration (optional)

## Installation

```
git clone https://github.com/popshia/nvim ~/.config/
nvim +PackerSync
```

## Plugins

### Utility

- [Packer](https://github.com/wbthomason/packer.nvim) -- plugin manager
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) -- easily comment stuff
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) -- file icons
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) -- file explorer
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) -- terminal integration
- [project.nvim](https://github.com/ahmedkhalf/project.nvim") -- project searching
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) -- show your tab and indents
- [bufdelete.nvim](https://github.com/famiu/bufdelete.nvim) -- better buffer manipulation
- [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) -- smooth scroll
- [impatient.nvim](https://github.com/lewis6991/impatient.nvim) -- improve startup speed
- [hop.nvim](https://github.com/phaazon/hop.nvim) -- hop to any word you like
- [nvim-notify](https://github.com/rcarriga/nvim-notify) -- nice interface for notifications
- [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens) -- search with count
- [nvim-colorizer.lua](https://github.com/norcall/nvim-colorizer.lua) -- show colors in nvim
- [mason.nvim](https://github.com/williamboman/mason.nvim) -- external editor tooling manager
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) -- mason lsp linker

### Interface

- [which-key](https:github.com/folke/which-key.nvim") -- show available keys after hitting space
- [alpha-nvim](https:github.com/goolord/alpha-nvim) -- startup page
- [lualine.nvim](https:github.com/nvim-lualine/lualine.nvim) -- status line
- [bufferline.nvim](https:github.com/akinsho/bufferline.nvim) -- buffer tab line
- [nvim-navic](https:github.com/SmiteshP/nvim-navic") -- status line position components
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) -- todo comments highlighting

### Markdown

- [tabular](https://github.com/godlygeek/tabular) -- text filtering
- [vim-markdown](https://github.com/preservim/vim-markdown) -- markdown mode
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) -- markdown preview

### Colorschemes

- [gruvbox-material](https://github.com/sainnhe/gruvbox-material) -- gruvbox

### Completion

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp") -- the completion plugin
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer") -- buffer completions
- [cmp-path](https://github.com/hrsh7th/cmp-path") -- path completions
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline") -- cmdline completions
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp") -- lsp completions
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua") -- lua completions
- [cmp-luasnip](https://github.com/saadparwaiz1/cmp_luasnip") -- snippet completions
- [cmp-under-comparator](https://github.com/lukas-reineke/cmp-under-comparator") -- sort completions options
- [cmp-tabnine](https://github.com/tzachar/cmp-tabnine) -- tabnine completions
- [surround.nvim](https://github.com/ur4ltz/surround.nvim) -- search with count
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) automate pair insertion, integrates with both cmp and treesitter

### Snippets

- [LuaSnip](https://github.com/L3MON4D3/LuaSnip") --snippet engine
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets") -- a bunch of snippets to use

### LSP

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig") -- enable LSP
- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer") -- simple to use language server installer
- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
- [vim-illuminate](https://github.com/RRethy/vim-illuminate") -- automatically highlighting other uses of the current word under the cursor
- [lsp_signature.nvim](https://github.com/ray-x/lsp_signature") -- for lsp signatures

### Telescope

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim") -- highly extendable fuzzy finder over lists

### Treesitter

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) -- treesitter for syntax highlighting
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context") -- show treesitter context
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) -- comment based on cursor location

### Git

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim") -- git integration
- [git-blame.nvim](https://github.com/f-person/git-blame.nvim") -- show git blames

### Debugging

- [nvim-dap](https://github.com/mfussenegger/nvim-dap") -- debugging client
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui") -- debugging interface

### Code runners

- [jaq-nvim](https://github.com/is0n/jaq-nvim") -- code runner

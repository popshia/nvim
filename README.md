# Neovim Configuration

A modern, feature-rich Neovim configuration focused on productivity and a smooth editing experience.

<a href="https://dotfyle.com/popshia/nvim"><img src="https://dotfyle.com/popshia/nvim/badges/plugins?style=for-the-badge" /></a>
<a href="https://dotfyle.com/popshia/nvim"><img src="https://dotfyle.com/popshia/nvim/badges/leaderkey?style=for-the-badge" /></a>
<a href="https://dotfyle.com/popshia/nvim"><img src="https://dotfyle.com/popshia/nvim/badges/plugin-manager?style=for-the-badge" /></a>


## Installation Instructions

> Install requires Neovim 0.9+. Always review the code before installing a configuration.

1. Clone the repository:

```bash
git clone git@github.com:popshia/nvim ~/.config/popshia/nvim
```

2. Open Neovim with this config (plugins will be automatically installed on first launch):

```bash
NVIM_APPNAME=popshia/nvim nvim
```

## Features

- Modern UI with [Gruvbox](https://github.com/sainnhe/gruvbox-material) theme
- Efficient code navigation with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Smart code completion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Built-in LSP configuration for multiple languages
- Git integration with [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- File navigation with [oil.nvim](https://github.com/stevearc/oil.nvim)
- Automatic formatting with [conform.nvim](https://github.com/stevearc/conform.nvim)
- Intuitive keybindings with [which-key](https://github.com/folke/which-key.nvim)

## Plugins

### bars-and-lines

+ [Bekaboo/dropbar.nvim](https://dotfyle.com/plugins/Bekaboo/dropbar.nvim)

### color

+ [brenoprata10/nvim-highlight-colors](https://dotfyle.com/plugins/brenoprata10/nvim-highlight-colors)
+ [xzbdmw/colorful-menu.nvim](https://dotfyle.com/plugins/xzbdmw/colorful-menu.nvim)

### colorscheme

+ [sainnhe/gruvbox-material](https://dotfyle.com/plugins/sainnhe/gruvbox-material)

### comment

+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
+ [folke/ts-comments.nvim](https://dotfyle.com/plugins/folke/ts-comments.nvim)

### cursorline

+ [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)

### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)

### editing-support

+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
+ [folke/snacks.nvim](https://dotfyle.com/plugins/folke/snacks.nvim)
+ [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
+ [gbprod/yanky.nvim](https://dotfyle.com/plugins/gbprod/yanky.nvim)

### file-explorer

+ [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)

### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)

### git

+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)

### indent

+ [shellRaining/hlchunk.nvim](https://dotfyle.com/plugins/shellRaining/hlchunk.nvim)

### keybinding

+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

+ [rachartier/tiny-inline-diagnostic.nvim](https://dotfyle.com/plugins/rachartier/tiny-inline-diagnostic.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [ray-x/lsp_signature.nvim](https://dotfyle.com/plugins/ray-x/lsp_signature.nvim)

### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### markdown-and-latex

+ [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)
+ [MeanderingProgrammer/markdown.nvim](https://dotfyle.com/plugins/MeanderingProgrammer/markdown.nvim)

### motion

+ [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)
+ [sphamba/smear-cursor.nvim](https://dotfyle.com/plugins/sphamba/smear-cursor.nvim)

### nvim-dev

+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [folke/lazydev.nvim](https://dotfyle.com/plugins/folke/lazydev.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### scrolling

+ [karb94/neoscroll.nvim](https://dotfyle.com/plugins/karb94/neoscroll.nvim)

### search

+ [kevinhwang91/nvim-hlslens](https://dotfyle.com/plugins/kevinhwang91/nvim-hlslens)

### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)

### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
+ [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)

### tabline

+ [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)

### terminal-integration

+ [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim)

### utility

+ [nguyenvukhang/nvim-toggler](https://dotfyle.com/plugins/nguyenvukhang/nvim-toggler)
+ [mcauley-penney/visual-whitespace.nvim](https://dotfyle.com/plugins/mcauley-penney/visual-whitespace.nvim)
+ [echasnovski/mini.nvim](https://dotfyle.com/plugins/echasnovski/mini.nvim)

### web-development

+ [luckasRanarison/tailwind-tools.nvim](https://dotfyle.com/plugins/luckasRanarison/tailwind-tools.nvim)

## Language Servers

This configuration includes support for the following language servers, which are automatically installed and configured via [Mason](https://github.com/williamboman/mason.nvim):

+ basedpyright
+ bashls
+ clangd
+ eslint
+ html-lsp html
+ lua_ls
+ marksman
+ svelte
+ tailwindcss
+ ts_ls

## Customization

You can customize this configuration by editing the files in the `~/.config/popshia/nvim/lua` directory. The configuration is organized as follows:

- `lua/config/`: Core configuration files
- `lua/plugins/`: Plugin-specific configurations

For more information, check out the [Lazy.nvim](https://github.com/folke/lazy.nvim) documentation.

## Feedback and Contributions

Feedback and contributions are welcome! Feel free to open an issue or submit a pull request on [GitHub](https://github.com/popshia/nvim).

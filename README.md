# 🚀 Neovim Configuration

A modern, feature-rich Neovim configuration focused on productivity and a smooth editing experience.

<div align="center">
  <a href="https://dotfyle.com/popshia/nvim"><img src="https://dotfyle.com/popshia/nvim/badges/plugins?style=for-the-badge" /></a>
  <a href="https://dotfyle.com/popshia/nvim"><img src="https://dotfyle.com/popshia/nvim/badges/leaderkey?style=for-the-badge" /></a>
  <a href="https://dotfyle.com/popshia/nvim"><img src="https://dotfyle.com/popshia/nvim/badges/plugin-manager?style=for-the-badge" /></a>
</div>

## 📋 Table of Contents

- [Requirements](#-requirements)
- [Installation](#-installation)
- [Key Features](#-key-features)
- [Directory Structure](#-directory-structure)
- [Plugins](#-plugins)
- [Language Servers](#-language-servers)
- [Customization](#️-customization)
- [Feedback and Contributions](#-feedback-and-contributions)
- [License](#-license)

## 🔧 Requirements

- Neovim 0.9+
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional but recommended)
- For some language servers: Node.js, Python, etc.

> ⚠️ Always review the code before installing a configuration.

## 📥 Installation

1. Clone the repository:

```bash
git clone git@github.com:popshia/nvim ~/.config/popshia/nvim
```

2. Open Neovim with this config (plugins will be automatically installed on first launch):

```bash
NVIM_APPNAME=popshia/nvim nvim
```

## ✨ Key Features

- **Modern UI**: Beautiful [Gruvbox](https://github.com/sainnhe/gruvbox-material) theme with clean statusline
- **Efficient Navigation**:
  - Code navigation with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - File browsing with [oil.nvim](https://github.com/stevearc/oil.nvim)
- **Developer Experience**:
  - Smart code completion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - Built-in LSP configuration for multiple languages
  - Git integration with [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
  - Automatic formatting with [conform.nvim](https://github.com/stevearc/conform.nvim)
- **Productivity**:
  - Intuitive keybindings with [which-key](https://github.com/folke/which-key.nvim)
  - Terminal integration with [toggleterm](https://github.com/akinsho/toggleterm.nvim)

## 📁 Directory Structure

```
nvim/
├── ftplugin/         # Filetype-specific settings
├── lsp/              # Language server configurations
├── lua/
│   └── user/
│       ├── core/     # Core configuration (options, keymaps, etc.)
│       └── plugins/  # Plugin-specific configurations
└── init.lua          # Entry point
```

## 🔌 Plugins

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. Below is a categorized list of all included plugins:

### UI Components

#### Bars and Lines
+ [Bekaboo/dropbar.nvim](https://dotfyle.com/plugins/Bekaboo/dropbar.nvim) - Breadcrumb navigation bar
+ [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim) - Buffer line with tab integration
+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim) - Statusline
+ [shellRaining/hlchunk.nvim](https://dotfyle.com/plugins/shellRaining/hlchunk.nvim) - Indent guides

#### Colors and Themes
+ [sainnhe/gruvbox-material](https://dotfyle.com/plugins/sainnhe/gruvbox-material) - Main colorscheme
+ [brenoprata10/nvim-highlight-colors](https://dotfyle.com/plugins/brenoprata10/nvim-highlight-colors) - Color highlighter
+ [xzbdmw/colorful-menu.nvim](https://dotfyle.com/plugins/xzbdmw/colorful-menu.nvim) - Colorful menus

### Code Intelligence

#### LSP (Language Server Protocol)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig) - Configurations for built-in LSP client
+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim) - Package manager for LSP servers
+ [rachartier/tiny-inline-diagnostic.nvim](https://dotfyle.com/plugins/rachartier/tiny-inline-diagnostic.nvim) - Inline diagnostics
+ [ray-x/lsp_signature.nvim](https://dotfyle.com/plugins/ray-x/lsp_signature.nvim) - Function signature help

#### Syntax and Parsing
+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter) - Syntax highlighting and code parsing
+ [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects) - Text objects based on treesitter

#### Snippets
+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip) - Snippet engine
+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets) - Collection of snippets

### Editing Experience

#### Code Formatting
+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim) - Formatter

#### Commenting
+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim) - Highlight and search TODO comments
+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim) - Smart commenting
+ [folke/ts-comments.nvim](https://dotfyle.com/plugins/folke/ts-comments.nvim) - Treesitter-based comments

#### Editing Helpers
+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs) - Auto-close pairs
+ [folke/snacks.nvim](https://dotfyle.com/plugins/folke/snacks.nvim) - Small utilities
+ [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag) - Auto-close HTML/XML tags
+ [gbprod/yanky.nvim](https://dotfyle.com/plugins/gbprod/yanky.nvim) - Improved yank and paste
+ [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate) - Highlight other uses of word under cursor

### Navigation and Search

#### File Navigation
+ [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim) - File explorer in buffer
+ [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim) - Enhanced motions
+ [sphamba/smear-cursor.nvim](https://dotfyle.com/plugins/sphamba/smear-cursor.nvim) - Cursor effects
+ [karb94/neoscroll.nvim](https://dotfyle.com/plugins/karb94/neoscroll.nvim) - Smooth scrolling
+ [kevinhwang91/nvim-hlslens](https://dotfyle.com/plugins/kevinhwang91/nvim-hlslens) - Search lens

#### Diagnostics and Issues
+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim) - Pretty diagnostics list

### Integrations

#### Git
+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim) - Git integration

#### Terminal
+ [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim) - Terminal integration

#### Markdown and Documentation
+ [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim) - Markdown preview
+ [MeanderingProgrammer/markdown.nvim](https://dotfyle.com/plugins/MeanderingProgrammer/markdown.nvim) - Markdown utilities

#### Web Development
+ [luckasRanarison/tailwind-tools.nvim](https://dotfyle.com/plugins/luckasRanarison/tailwind-tools.nvim) - Tailwind CSS tools

### Utilities

#### Core Utilities
+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim) - Keybinding helper
+ [nguyenvukhang/nvim-toggler](https://dotfyle.com/plugins/nguyenvukhang/nvim-toggler) - Toggle words
+ [mcauley-penney/visual-whitespace.nvim](https://dotfyle.com/plugins/mcauley-penney/visual-whitespace.nvim) - Visualize whitespace
+ [echasnovski/mini.nvim](https://dotfyle.com/plugins/echasnovski/mini.nvim) - Collection of minimal plugins

#### Neovim Development
+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim) - UI component library
+ [folke/lazydev.nvim](https://dotfyle.com/plugins/folke/lazydev.nvim) - Development helper for lazy.nvim
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim) - Lua functions library
+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim) - Plugin manager

## 🌐 Language Servers

This configuration includes support for the following language servers, which are automatically installed and configured via [Mason](https://github.com/williamboman/mason.nvim):

| Language Server | Language/Framework |
|-----------------|-------------------|
| basedpyright    | Python            |
| bashls          | Bash              |
| clangd          | C/C++             |
| eslint          | JavaScript/TypeScript |
| html-lsp        | HTML              |
| lua_ls          | Lua               |
| marksman        | Markdown          |
| svelte          | Svelte            |
| tailwindcss     | Tailwind CSS      |
| ts_ls           | TypeScript        |

Each language server is configured with sensible defaults in the `lsp/` directory.

## 🛠️ Customization

You can customize this configuration by editing the files in the `~/.config/popshia/nvim/lua` directory:

### Key Files to Modify

- **Core Settings**:
  - `lua/user/core/options.lua` - Editor options (tabs, line numbers, etc.)
  - `lua/user/core/keymaps.lua` - Key mappings
  - `lua/user/core/autocommands.lua` - Automatic commands

- **Plugin Settings**:
  - `lua/user/plugins/` - Individual plugin configurations

### Adding New Plugins

To add a new plugin, create a new file in the `lua/user/plugins/` directory following the lazy.nvim format:

```lua
return {
  "username/plugin-name",
  config = function()
    -- Your configuration here
  end,
}
```

For more information, check out the [Lazy.nvim](https://github.com/folke/lazy.nvim) documentation.

## 🤝 Feedback and Contributions

Feedback and contributions are welcome! This configuration is designed to be a starting point that you can customize to fit your workflow.

- **Issues**: Report bugs or suggest features on [GitHub](https://github.com/popshia/nvim/issues)
- **Pull Requests**: Contributions are appreciated! Please follow the existing code style
- **Questions**: Feel free to open discussions for any questions about the configuration

## 📝 License

This Neovim configuration is open source and available under the MIT License.

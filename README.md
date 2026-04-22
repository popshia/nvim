# nvim

This is my personal Neovim configuration, meticulously crafted for a productive, visually appealing, and highly customized development experience. It leverages the latest Neovim 0.12+ features, including the built-in `vim.pack` for efficient, native plugin management.

## ✨ Features

- **🚀 Native & Fast**: Built with Neovim 0.12's `vim.pack.add` for native plugin loading, ensuring minimal overhead and blazing fast startup.
- **🧠 Smart LSP Integration**: Robust language support via `nvim-lspconfig` and `mason.nvim`. Includes `tiny-inline-diagnostic.nvim` for modern diagnostics and `fidget.nvim` for progress UI.
- **🤖 AI-Powered Workflow**: Integrated with `sidekick.nvim` for seamless Gemini and Copilot assistance, featuring intelligent next-edit suggestions and a dedicated AI assistant.
- **💡 Refined Editing Experience**:
    - **Autocompletion**: High-performance completion powered by `blink.cmp` and `LuaSnip`.
    - **Advanced Navigation**: Swift jumping with `flash.nvim` and bracket-based navigation with `mini.bracketed`.
    - **Powerful Manipulation**: Full `mini.nvim` suite for text objects, surroundings, split/join, and alignment, plus `nvim-toggler` for keyword flipping.
    - **Git Integration**: Comprehensive Git support with `gitsigns.nvim` for hunk management and `snacks.nvim` for LazyGit integration.
- **🎨 Polished UI**:
    - **Theme**: A customized `gruvbox-material` colorscheme with a refined statusline by `lualine.nvim`.
    - **Components**: `bufferline.nvim` for sleek tabs, `mini.indentscope` for indent visualization, and `neoscroll.nvim` for smooth scrolling.
    - **File Management**: `oil.nvim` allows editing the file system as if it were a normal buffer.
    - **Start Screen**: Personalized dashboard using `mini.starter`.

## 📂 File Structure

The configuration follows a modular structure where each feature has its own file in `plugin/` for automatic loading:

```
.
├── init.lua                -- Entry point & config helpers
├── plugin/                 -- Modular plugin configurations (auto-loaded)
│   ├── 00-colorscheme.lua  -- Colorscheme setup
│   ├── 10-options.lua      -- Standard Neovim options
│   ├── 20-keymaps.lua      -- Core keybindings
│   ├── blink.lua           -- Autocomplete (blink.cmp)
│   ├── lsp-config.lua      -- LSP core setup & keymaps
│   ├── mini.lua            -- mini.nvim modules
│   ├── snacks.lua          -- Snacks.nvim utilities
│   └── treesitter.lua      -- Treesitter configuration
├── after/
│   ├── ftplugin/           -- Filetype-specific overrides
│   └── lsp/                -- Language-specific LSP server settings
└── bench/                  -- Performance benchmarks
```

## 📦 Installation

### Prerequisites

- **Neovim**: Version 0.12.0 or higher (required for `vim.pack`).
- **Git**: For cloning the repository.
- **ripgrep** & **fd**: For advanced searching and file finding.
- **A Nerd Font**: Recommended for icons (e.g., [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)).

### Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/popshia/nvim.git ~/.config/nvim
   ```
2. **Start Neovim**:
   ```bash
   nvim
   ```
   Plugins will be automatically registered and loaded via `vim.pack.add`.

## 🤖 LSP (Language Server Protocol)

LSP servers and tools are managed through `mason.nvim`. The following are configured for automatic installation:

- **LSPs**: `basedpyright`, `lua_ls`, `markdown_oxide`, `ruff`, `ts_ls`, `clangd`, `fish_lsp`, `copilot`.
- **Formatters/Linters**: `stylua`, `codespell`.
- **Native Support**: `sourcekit-lsp` (Swift) is configured to use `xcrun`.

## ⌨️ Keymaps

The leader key is set to `<Space>`.

### General

| Key | Description |
| :--- | :--- |
| `<Esc>` | Clear search highlighting |
| `<C-h/j/k/l>` | Focus window left/down/up/right |
| `<C-Up/Down>` | Resize window horizontally |
| `<C--/+>` | Resize window vertically |
| `H`/`L` | Previous/Next buffer |
| `J`/`K` | Move selected line(s) down/up |
| `gh`/`gl` | Move cursor to line start/end |
| `ycc` | Duplicate and comment the current line |
| `v` + `/` | Search within the visual selection |

### Plugins

| Key | Plugin | Description |
| :--- | :--- | :--- |
| `<leader>ms` | `mason.nvim` | Show the Mason installer UI |
| `s` | `flash.nvim` | Jump to any position in the visible buffer |
| `]g`/`[g` | `gitsigns.nvim` | Go to the next/previous git hunk |
| `<leader>gb` | `gitsigns.nvim` | Blame the current line |
| `<leader>gh` | `gitsigns.nvim` | Preview the hunk under the cursor |
| `gd`/`gk` | `lsp-config` | Go to Definition / Hover Documentation |
| `grn`/`gra` | `lsp-config` | Rename symbol / Code actions (0.11+ defaults) |
| `grr`/`gri` | `lsp-config` | Show references / implementation |
| `<leader>ih` | `lsp-config` | Toggle inlay hints |
| `<leader>sj` | `mini.splitjoin` | Toggle split/join of code blocks |
| `ys`/`ds`/`cs` | `mini.surround` | Add/delete/change surroundings |
| `<leader>a`/`<leader>A`| `mini.align` | Align text (with preview) |
| `[b`/`]b` | `mini.bracketed` | Navigate between buffers |
| `<leader>i` | `nvim-toggler` | Toggle a variable or keyword (e.g., `true`/`false`) |
| `<leader>e` | `oil.nvim` | Toggle the file explorer |
| `<leader>sf`/`st`/`sr` | `snacks.nvim` | Search files/text/recent files |
| `<leader>sk`/`sb` | `snacks.nvim` | Search keymaps/buffers |
| `<leader>si`/`sm` | `snacks.nvim` | Search icons / notification history |
| `<leader>q` | `snacks.nvim` | Delete the current buffer |
| `<leader>su` | `undotree` | Toggle the undo tree |
| `<leader>s.` | `sidekick.nvim` | Toggle Sidekick CLI |
| `<leader>gm`/`<leader>cp`| `sidekick.nvim` | Toggle Gemini / Copilot Sidekick |
| `<tab>` | `sidekick.nvim` | Jump or apply next edit suggestion |
| `<C-\>` | `toggleterm.nvim` | Toggle a floating terminal |

## 🔌 Plugins Overview

<details>
<summary><strong>Core & Utility</strong></summary>

- **[mason.nvim](https://github.com/williamboman/mason.nvim)**: LSP/DAP/Linter/Formatter manager.
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Native LSP configurations.
- **[conform.nvim](https://github.com/stevearc/conform.nvim)**: Lightweight formatting engine.
- **[snacks.nvim](https://github.com/folke/snacks.nvim)**: High-quality QoL utilities (pickers, etc.).
- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)**: Persistent terminal management.
- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)**: Smart TODO highlighting.
- **[guess-indent.nvim](https://github.com/nmac427/guess-indent.nvim)**: Automatic indentation detection.
- **[fidget.nvim](https://github.com/j-hui/fidget.nvim)**: Standalone UI for LSP progress.

</details>

<details>
<summary><strong>UI & Appearance</strong></summary>

- **[gruvbox-material](https://github.com/sainnhe/gruvbox-material)**: Primary colorscheme.
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)**: Stylish buffer tabs.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: Fast and easy-to-configure statusline.
- **[tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim)**: Modern inline diagnostics.
- **[neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)**: Smooth scrolling.
- **[mini.starter](https://github.com/echasnovski/mini.starter)**: Minimal and fast start screen.
- **[mini.indentscope](https://github.com/echasnovski/mini.indentscope)**: Visualize indent scope.

</details>

<details>
<summary><strong>Editing & Development</strong></summary>

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Treesitter parsing and highlighting.
- **[blink.cmp](https://github.com/saghen/blink.cmp)**: Blazing fast completion engine.
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: Feature-rich snippet engine.
- **[flash.nvim](https://github.com/folke/flash.nvim)**: Precise text navigation.
- **[oil.nvim](https://github.com/stevearc/oil.nvim)**: Filesystem editing as a buffer.
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Git hunk indicators and actions.
- **[mini.nvim](https://github.com/echasnovski/mini.nvim)**: Minimalistic utilities (`ai`, `pairs`, `surround`, `splitjoin`, `icons`, `cursorword`, `align`, `bracketed`).
- **[sidekick.nvim](https://github.com/folke/sidekick.nvim)**: AI assistant and diagnostics sidebar.
- **[undotree](https://github.com/mbbill/undotree)**: Visualizes the undo history.
- **[nvim-toggler](https://github.com/nguyenvukhang/nvim-toggler)**: Boolean and keyword toggling.

</details>


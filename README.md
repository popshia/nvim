# nvim

This is my personal Neovim configuration, meticulously crafted for a productive, visually appealing, and highly customized development experience. It leverages the latest Neovim 0.12+ features, including the built-in `vim.pack` for efficient, native plugin management.

## ✨ Features

- **🚀 Native & Fast**: Built with Neovim 0.12's `vim.pack.add` for native plugin loading, ensuring minimal overhead and blazing fast startup.
- **🧠 Smart LSP Integration**: Robust language support via `nvim-lspconfig` and `mason.nvim`. Includes `tiny-inline-diagnostic.nvim` for a modern, non-intrusive diagnostic display.
- **🤖 AI-Powered Workflow**: Integrated with `sidekick.nvim` for seamless Gemini and Copilot assistance, featuring intelligent next-edit suggestions and a dedicated AI CLI.
- **💡 Refined Editing Experience**:
    - **Autocompletion**: High-performance completion powered by `blink.cmp` and `LuaSnip`.
    - **Advanced Navigation**: Swift jumping with `flash.nvim` and a clear code structure overview via `symbols.nvim`.
    - **Powerful Manipulation**: Includes `mini.nvim` for text objects, surroundings, and split/join operations, plus `nvim-toggler` for quick keyword flipping.
    - **Git Integration**: Comprehensive Git support with `gitsigns.nvim` for hunk management and `oil-git.nvim` for Git status in the file explorer.
- **🎨 Polished UI**:
    - **Theme**: A customized `gruvbox-material` colorscheme for a comfortable, high-contrast aesthetic.
    - **Components**: `bufferline.nvim` for sleek tabs, `hlchunk.nvim` for indent visualization, and `neoscroll.nvim` for smooth scrolling.
    - **File Management**: `oil.nvim` allows editing the file system as if it were a normal buffer.

## 📂 File Structure

The configuration follows a modular structure, separating core settings from plugin-specific logic:

```
.
├── init.lua                -- Minimal entry point
├── lua/
│   ├── autocommands.lua    -- Editor autocommands
│   ├── keymaps.lua         -- Core keybindings and map() helper
│   └── options.lua         -- Standard Neovim options
├── plugin/                 -- Modular plugin configurations (auto-loaded)
├── after/
│   ├── ftplugin/           -- Filetype-specific overrides
│   └── lsp/                -- Language-specific LSP server settings
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

LSP servers are managed through `mason.nvim`. The following are configured for automatic installation:

- `basedpyright` (Python)
- `lua_ls` (Lua)
- `markdown_oxide` (Markdown)
- `ruff` (Python)
- `ts_ls` (TypeScript/JavaScript)
- `sourcekit-lsp` (Swift - managed via `xcrun`)
- `clangd` (C++)

## ⌨️ Keymaps

The leader key is set to `<Space>`.

### General

| Key | Description |
| :--- | :--- |
| `<Esc>` | Clear search highlighting |
| `<C-h/j/k/l>` | Focus window left/down/up/right |
| `<C-Up/Down>` | Resize window horizontally |
| `<C--/+>` | Resize window vertically |
| `J`/`K` | Move selected line(s) down/up |
| `H`/`L` | Previous/Next buffer |
| `ycc` | Duplicate and comment the current line |
| `gh`/`gl` | Move cursor to line start/end |
| `v` + `/` | Search within the visual selection |

### Plugins

| Key | Plugin | Description |
| :--- | :--- | :--- |
| `<leader>ms` | `mason.nvim` | Show the Mason installer UI |
| `<leader>ff` | `conform.nvim` | Format the current file |
| `s` | `flash.nvim` | Jump to any position in the visible buffer |
| `]g`/`[g` | `gitsigns.nvim` | Go to the next/previous git hunk |
| `<leader>gb` | `gitsigns.nvim` | Blame the current line |
| `<leader>gh` | `gitsigns.nvim` | Preview the hunk under the cursor |
| `n`/`N` | `hlslens.nvim` | Next/previous search result with lens |
| `gd`/`gr`/`gi` | `lsp-config` | Go to Definition/References/Implementation |
| `gk` | `lsp-config` | Show hover documentation |
| `gs` | `lsp-config` | Show signature help |
| `<leader>rn` | `lsp-config` | Rename symbol |
| `<leader>ca` | `lsp-config` | Show code actions |
| `<leader>ih` | `lsp-config` | Toggle inlay hints |
| `<leader>sj` | `mini.splitjoin` | Toggle split/join of code blocks |
| `ys`/`ds`/`cs` | `mini.surround` | Add/delete/change surroundings |
| `<leader>i` | `nvim-toggler` | Toggle a variable or keyword (e.g., `true`/`false`) |
| `<leader>e` | `oil.nvim` | Toggle the floating file explorer |
| `<leader>ds`/`ws` | `snacks.nvim` | Search document/workspace symbols |
| `<leader>sf`/`st`/`sr` | `snacks.nvim` | Search files/text/recent files |
| `<leader>sk`/`su`/`sb` | `snacks.nvim` | Search keymaps/undo history/buffers |
| `<leader>sm`/`si` | `snacks.nvim` | Notification history / Icons |
| `Q` / `<leader>bd` | `snacks.nvim` | Delete the current buffer |
| `<leader>s.` | `sidekick.nvim` | Toggle Sidekick CLI |
| `<leader>gm`/`<leader>cp`| `sidekick.nvim` | Toggle Gemini / Copilot Sidekick |
| `<leader>sp` | `sidekick.nvim` | Ask Sidekick prompt |
| `<leader>sv` | `sidekick.nvim` | Send selection to Sidekick |
| `<tab>` | `sidekick.nvim` | Jump or apply next edit suggestion |
| `<leader>so` | `symbols.nvim` | Toggle the symbol outline sidebar |
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
- **[auto-cmdheight.nvim](https://github.com/jake-stewart/auto-cmdheight.nvim)**: Dynamic command line height.

</details>

<details>
<summary><strong>UI & Appearance</strong></summary>

- **[gruvbox-material](https://github.com/sainnhe/gruvbox-material)**: Primary colorscheme.
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)**: Stylish buffer tabs.
- **[symbols.nvim](https://github.com/oskarrrrrrr/symbols.nvim)**: Code symbol sidebar.
- **[sidekick.nvim](https://github.com/folke/sidekick.nvim)**: AI assistant and diagnostics sidebar.
- **[hlchunk.nvim](https://github.com/shellRaining/hlchunk.nvim)**: Indent and chunk visualization.
- **[tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim)**: Modern inline diagnostics.
- **[neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)**: Smooth scrolling.
- **[hlslens.nvim](https://github.com/kevinhwang91/nvim-hlslens)**: Search result enhancements.

</details>

<details>
<summary><strong>Editing & Development</strong></summary>

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Treesitter parsing and highlighting.
- **[blink.cmp](https://github.com/saghen/blink.cmp)**: Blazing fast completion engine.
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: Feature-rich snippet engine.
- **[flash.nvim](https://github.com/folke/flash.nvim)**: Precise text navigation.
- **[oil.nvim](https://github.com/stevearc/oil.nvim)**: Filesystem editing as a buffer.
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Git hunk indicators and actions.
- **[mini.nvim](https://github.com/echasnovski/mini.nvim)**: Minimalistic utilities (`ai`, `surround`, `splitjoin`, `icons`, `cursorword`).
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)**: Smart code commenting.
- **[nvim-toggler](https://github.com/nguyenvukhang/nvim-toggler)**: Boolean and keyword toggling.

</details>

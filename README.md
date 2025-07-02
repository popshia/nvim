# nvim

> this readme file is generated using gemini-cli.

This is my personal Neovim configuration, meticulously crafted for a productive, visually appealing, and highly customized development experience. It is built upon `lazy.nvim` for robust plugin management and features a modular structure that separates concerns, making it easy to maintain and extend.

## ✨ Features

-   **🚀 Fast & Lazy-Loaded**: Built with `lazy.nvim` to ensure fast startup times by loading plugins on demand.
-   **🧠 Smart LSP Integration**: Deep language support with `nvim-lspconfig`, `mason.nvim` for automatic LSP server management, and `trouble.nvim` for elegant diagnostic display.
-   **💡 Enhanced Editing Experience**:
    -   **Autocompletion**: Intelligent and fast completion powered by `blink.cmp` and `LuaSnip`.
    -   **Advanced Navigation**: Swift code navigation with `flash.nvim` for jumping and `symbols.nvim` for code outlines.
    -   **Powerful Text Manipulation**: Includes `mini.nvim` for surrounding and split/join, `nvim-toggler` for boolean/keyword flipping, and powerful comment tools.
    -   **Git Integration**: Seamless Git integration within the editor via `gitsigns.nvim` and quick access to Lazygit through `snacks.nvim`.
-   **🎨 Modern & Polished UI**:
    -   **Theme**: A customized `gruvbox-material` colorscheme.
    -   **Components**: A clean `lualine.nvim` statusline, `bufferline.nvim` for tabs, `dropbar.nvim` for breadcrumbs, and `hlchunk.nvim` for indent visualization.
    -   **File Management**: A beautiful floating file explorer powered by `oil.nvim`.
-   **📝 Markdown Support**: Enhanced markdown editing with live preview.
-   **✅ Fully Documented**: Keymaps and features are documented directly in the configuration and summarized in this README.

## 📂 File Structure

The configuration is organized logically to make it easy to navigate and modify:

```
.
├── init.lua                -- Main entry point
├── lua/
│   └── user/
│       ├── lazy.lua          -- lazy.nvim setup and plugin manager bootstrapping
│       ├── core/             -- Core editor settings
│       │   ├── autocommands.lua -- Global autocommands
│       │   ├── keymaps.lua   -- Global keybindings
│       │   └── options.lua   -- Vim options (set)
│       └── plugins/          -- All plugin specifications (one file per plugin)
├── after/
│   └── lsp/                  -- Language-specific LSP server settings
└── ftplugin/                 -- Filetype-specific settings (e.g., tab widths)
```

## 📦 Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/popshia/nvim.git ~/.config/nvim
    ```
2.  **Start Neovim**:
    ```
    nvim
    ```
    `lazy.nvim` will automatically handle the installation of all plugins on the first run.

## ⌨️ Keymaps

Keymaps are set in `lua/user/core/keymaps.lua` and within each plugin's configuration file in `lua/user/plugins/`.

### General

| Key | Description |
| :--- | :--- |
| `<Space>` | **Leader key** |
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
| `<leader>lz` | `lazy.nvim` | Show the Lazy plugin manager UI |
| `<leader>ff` | `conform.nvim` | Format the current file |
| `<leader>;` | `dropbar.nvim` | Pick symbols from the winbar breadcrumbs |
| `s` | `flash.nvim` | Jump to any position in the visible buffer |
| `]g`/`[g` | `gitsigns.nvim` | Go to the next/previous git hunk |
| `<leader>gb` | `gitsigns.nvim` | Blame the current line |
| `<leader>gh` | `gitsigns.nvim` | Preview the hunk under the cursor |
| `n`/`N` | `hlslens.nvim` | Go to next/previous search result with lens |
| `[[`/`]]` | `vim-illuminate` | Go to previous/next reference of the word under cursor |
| `gd`/`gr`/`gi` | `lsp-config` | Go to Definition/References/Implementation |
| `gk` | `lsp-config` | Show hover documentation |
| `gs` | `lsp-config` | Show signature help |
| `<leader>rn` | `lsp-config` | Rename symbol |
| `<leader>ca` | `lsp-config` | Show code actions |
| `<leader>li` | `lsp-config` | Show LSP information |
| `<leader>md` | `markdown.nvim` | Toggle markdown preview |
| `<leader>ms` | `mason.nvim` | Show the Mason installer UI |
| `<leader>sj` | `mini.splitjoin` | Toggle split/join of code blocks |
| `ys`/`ds`/`cs` | `mini.surround` | Add/delete/change surroundings |
| `<leader>i` | `nvim-toggler` | Toggle a variable or keyword (e.g., `true`/`false`) |
| `<leader>e` | `oil.nvim` | Toggle the floating file explorer |
| `<leader>ds`/`ws` | `snacks.nvim` | Search document/workspace symbols |
| `<leader>sf`/`st`/`sr` | `snacks.nvim` | Search files/text/recent files |
| `<leader>sk`/`su`/`sb` | `snacks.nvim` | Search keymaps/undo history/buffers |
| `<leader>lg` | `snacks.nvim` | Open Lazygit in a floating terminal |
| `<leader>gs`/`gl` | `snacks.nvim` | Search Git status/log |
| `<leader>sd` | `snacks.nvim` | Search for TODO comments |
| `Q` / `<leader>bd` | `snacks.nvim` | Delete the current buffer |
| `<leader>so` | `symbols.nvim` | Toggle the symbol outline sidebar |
| `<c-\>` | `toggleterm.nvim` | Toggle a floating terminal |
| `<leader>ls` | `trouble.nvim` | Toggle LSP diagnostics list |
| `<leader>dd`/`wd` | `trouble.nvim` | Toggle document/workspace diagnostics |
| `<leader>qf` | `trouble.nvim` | Toggle the quickfix list in Trouble |
| `<leader>/` | `which-key.nvim` | Show buffer-local keymaps |

## 🔌 Plugins Overview

This configuration uses a curated list of plugins to achieve its functionality. They are managed in `lua/user/lazy.lua` and configured in the `lua/user/plugins/` directory.

<details>
<summary><strong>Core & Utility</strong></summary>

-   **[lazy.nvim](https://github.com/folke/lazy.nvim)**: The plugin manager.
-   **[mason.nvim](https://github.com/williamboman/mason.nvim)**: Manages LSP servers, DAP servers, linters, and formatters.
-   **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Configurations for the Neovim LSP client.
-   **[conform.nvim](https://github.com/stevearc/conform.nvim)**: A lightweight and opinionated formatting plugin.
-   **[snacks.nvim](https://github.com/folke/snacks.nvim)**: A collection of useful UI components and utilities.
-   **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)**: A powerful terminal manager.
-   **[which-key.nvim](https://github.com/folke/which-key.nvim)**: Displays a popup with possible keybindings.
-   **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)**: Highlights and searches for TODO comments.

</details>

<details>
<summary><strong>UI & Appearance</strong></summary>

-   **[gruvbox-material](https://github.com/sainnhe/gruvbox-material)**: The primary colorscheme.
-   **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A feature-rich statusline.
-   **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)**: A stylish buffer line (tabs).
-   **[dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)**: IDE-like breadcrumbs in the winbar.
-   **[symbols.nvim](https://github.com/oskarrrrrrr/symbols.nvim)**: A sidebar for viewing code symbols.
-   **[hlchunk.nvim](https://github.com/shellRaining/hlchunk.nvim)**: Highlights the current code chunk/indentation level.
-   **[smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim)**: A fun cursor animation plugin.
-   **[nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors)**: Highlights color codes in your files.
-   **[visual-whitespace.nvim](https://github.com/mcauley-penney/visual-whitespace.nvim)**: Shows whitespace characters in visual mode.

</details>

<details>
<summary><strong>Editing & Development</strong></summary>

-   **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Provides advanced syntax highlighting and code parsing.
-   **[blink.cmp](https://github.com/saghen/blink.cmp)**: A fast and feature-rich autocompletion engine.
-   **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: A powerful snippet engine.
-   **[flash.nvim](https://github.com/folke/flash.nvim)**: In-editor navigation via quick text jumps.
-   **[oil.nvim](https://github.com/stevearc/oil.nvim)**: A modern file explorer that edits the filesystem like a buffer.
-   **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Git integration in the sign column.
-   **[trouble.nvim](https://github.com/folke/trouble.nvim)**: A pretty list for diagnostics, references, and more.
-   **[mini.nvim](https://github.com/echasnovski/mini.nvim)**: A collection of minimal, single-file plugins (`ai`, `surround`, `splitjoin`).
-   **[Comment.nvim](https://github.com/numToStr/Comment.nvim)**: Smart commenting.
-   **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: Automatically inserts and manages pairs of brackets, quotes, etc.
-   **[markdown.nvim](https://github.com/MeanderingProgrammer/markdown.nvim)**: Enhanced markdown support with preview.
-   **[nvim-toggler](https://github.com/nguyenvukhang/nvim-toggler)**: Toggles keywords and values (e.g., `true` to `false`).
-   **[vim-illuminate](https://github.com/RRethy/vim-illuminate)**: Highlights other uses of the word under the cursor.

</details>


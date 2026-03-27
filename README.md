# nvim

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
    -   **File Management**: A powerful terminal file manager powered by `oil.nvim`.
-   **📝 Markdown Support**: Enhanced markdown editing with `markview.nvim`.
-   **✅ Fully Documented**: Keymaps and features are documented directly in the configuration and summarized in this README.

## 📂 File Structure

The configuration is organized logically to make it easy to navigate and modify:

```
.
├── init.lua                -- Main entry point
├── lua/
│   ├── lazy-bootstrap.lua  -- lazy.nvim setup
│   ├── core/               -- Core editor settings
│   │   ├── autocommands.lua
│   │   ├── keymaps.lua
│   │   └── options.lua
│   └── plugins/            -- Plugin configurations
├── after/
│   ├── ftplugin/           -- Filetype-specific settings
│   └── lsp/                -- Language-specific LSP server settings
```

## 📦 Installation

### Prerequisites

Before you begin, ensure you have the following dependencies installed:

-   **Neovim**: Version 0.9.0 or higher.
-   **Git**: For cloning the configuration and managing plugins.
-   **Node.js**: (v18.0.0 or higher recommended) Required for some plugins and LSPs. We recommend using a version manager like [nvm](https://github.com/nvm-sh/nvm).
-   **Python 3.10+**: Required for Python-based tools and plugins. We recommend using a version manager like [pyenv](https://github.com/pyenv/pyenv).
-   **Build Tools**: A C compiler, `make`, `unzip`, `wget`, and `curl` are required for building some plugins and LSPs.
-   **ripgrep**: For fast searching.
-   **fd**: For finding files.
-   **A Nerd Font**: For icons to display correctly. I recommend [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads).

### Setup

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/popshia/nvim.git ~/.config/nvim
    ```
2.  **Start Neovim**:
    ```
    nvim
    ```
    `lazy.nvim` will automatically handle the installation of all plugins on the first run.

### Updating

To update the configuration and plugins, run the following command from within Neovim:

```
:Lazy update
```

## 🤖 LSP (Language Server Protocol)

This configuration uses `mason.nvim` to automatically install and manage LSP servers. The following servers are configured to be installed by default:

- `basedpyright`
- `eslint`
- `html`
- `lua_ls`
- `markdown_oxide`
- `ruff`
- `tailwindcss`
- `ts_ls`

Note: `clangd` is also configured manually for C++ development.

## ⌨️ Keymaps

Keymaps are set in `lua/core/keymaps.lua` and within each plugin's configuration file in `lua/plugins/`.

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
| `gd`/`gr`/`gi` | `lsp-config` | Go to Definition/References/Implementation (via Trouble) |
| `gk` | `lsp-config` | Show hover documentation |
| `gs` | `lsp-config` | Show signature help |
| `<leader>rn` | `lsp-config` | Rename symbol |
| `<leader>ca` | `lsp-config` | Show code actions |
| `<leader>li` | `lsp-config` | Show LSP information |
| `<leader>ih` | `lsp-config` | Toggle inlay hints |
| `<leader>ms` | `mason.nvim` | Show the Mason installer UI |
| `<leader>sj` | `mini.splitjoin` | Toggle split/join of code blocks |
| `ys`/`ds`/`cs` | `mini.surround` | Add/delete/change surroundings |
| `<leader>i` | `nvim-toggler` | Toggle a variable or keyword (e.g., `true`/`false`) |
| `<leader>e` | `oil.nvim` | Toggle the floating file explorer |
| `<leader>ds`/`ws` | `snacks.nvim` | Search document/workspace symbols |
| `<leader>sf`/`st`/`sr` | `snacks.nvim` | Search files/text/recent files |
| `<leader>sk`/`su`/`sb` | `snacks.nvim` | Search keymaps/undo history/buffers |
| `<leader>sm`/`si` | `snacks.nvim` | Notification history / Icons |
| `<leader>lg` | `snacks.nvim` | Open Lazygit in a floating terminal |
| `<leader>gs` | `snacks.nvim` | Open changed file |
| `<leader>gl` | `snacks.nvim` | Checkout commit |
| `<leader>sd` | `snacks.nvim` | Search for TODO comments |
| `Q` / `<leader>bd` | `snacks.nvim` | Delete the current buffer |
| `<leader>s.` | `sidekick.nvim` | Toggle Sidekick CLI |
| `<leader>gm`/`<leader>cp`| `sidekick.nvim` | Toggle Gemini / Copilot Sidekick |
| `<leader>sp` | `sidekick.nvim` | Ask Sidekick prompt |
| `<tab>` | `sidekick.nvim` | Jump or apply next edit suggestion |
| `<leader>so` | `symbols.nvim` | Toggle the symbol outline sidebar |
| `<C-\>` | `toggleterm.nvim` | Toggle a floating terminal |
| `<leader>dd`/`wd` | `trouble.nvim` | Toggle document/workspace diagnostics |
| `<leader>qf` | `trouble.nvim` | Toggle the quickfix list in Trouble |
| `<leader>/` | `which-key.nvim` | Show buffer-local keymaps |
| `<leader>X` | `xcodebuild.nvim` | Show all Xcodebuild actions |
| `<leader>xb`/`<leader>xr`| `xcodebuild.nvim` | Build / Build & Run Project |
| `<leader>xt` | `xcodebuild.nvim` | Run Tests |

## 🔌 Plugins Overview

This configuration uses a curated list of plugins to achieve its functionality. They are managed in `lua/lazy-bootstrap.lua` and configured in the `lua/plugins/` directory.

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
-   **[guess-indent.nvim](https://github.com/nmac427/guess-indent.nvim)**: Automatic indentation style detection.
-   **[auto-cmdheight.nvim](https://github.com/jake-stewart/auto-cmdheight.nvim)**: Automatically adjusts the command line height.

</details>

<details>
<summary><strong>UI & Appearance</strong></summary>

-   **[gruvbox-material](https://github.com/sainnhe/gruvbox-material)**: The primary colorscheme.
-   **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A feature-rich statusline.
-   **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)**: A stylish buffer line (tabs).
-   **[dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)**: IDE-like breadcrumbs in the winbar.
-   **[symbols.nvim](https://github.com/oskarrrrrrr/symbols.nvim)**: A sidebar for viewing code symbols.
-   **[sidekick.nvim](https://github.com/folke/sidekick.nvim)**: An AI-powered diagnostics and assistant sidebar.
-   **[hlchunk.nvim](https://github.com/shellRaining/hlchunk.nvim)**: Highlights the current code chunk/indentation level.
-   **[smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim)**: A fun cursor animation plugin.
-   **[visual-whitespace.nvim](https://github.com/mcauley-penney/visual-whitespace.nvim)**: Shows whitespace characters in visual mode.
-   **[tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim)**: Displays diagnostics inline.
-   **[neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)**: Smooth scrolling for Neovim.
-   **[hlslens.nvim](https://github.com/kevinhwang91/nvim-hlslens)**: Shows a lens for search results.

</details>

<details>
<summary><strong>Editing & Development</strong></summary>

-   **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Provides advanced syntax highlighting and code parsing.
-   **[blink.cmp](https://github.com/saghen/blink.cmp)**: A fast and feature-rich autocompletion engine.
-   **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: A powerful snippet engine.
-   **[flash.nvim](https://github.com/folke/flash.nvim)**: In-editor navigation via quick text jumps.
-   **[oil.nvim](https://github.com/stevearc/oil.nvim)**: A file explorer that lets you edit your file system like a normal Neovim buffer.
-   **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Git integration in the sign column.
-   **[trouble.nvim](https://github.com/folke/trouble.nvim)**: A pretty list for diagnostics, references, and more.
-   **[mini.nvim](https://github.com/echasnovski/mini.nvim)**: A collection of minimal, single-file plugins (`ai`, `surround`, `splitjoin`, `icons`, `cursorword`).
-   **[Comment.nvim](https://github.com/numToStr/Comment.nvim)**: Smart commenting.
-   **[markview.nvim](https://github.com/OXY2DEV/markview.nvim)**: Highly customizable markdown previewer.
-   **[nvim-toggler](https://github.com/nguyenvukhang/nvim-toggler)**: Toggles keywords and values (e.g., `true` to `false`).
-   **[xcodebuild.nvim](https://github.com/wojciech-kulik/xcodebuild.nvim)**: Xcode build integration.

</details>

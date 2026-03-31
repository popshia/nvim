# 🌙 Project Overview: Neovim Config (popshia/nvim)

This is a modern, high-performance Neovim configuration built with Neovim 0.12+ and Lua. It is designed for productivity, a refined UI, and deep AI integration.

## 🛠️ Key Technologies & Architecture

- **Core**: Neovim 0.12+, Lua, `vim.pack` (native plugin management).
- **Framework**: Uses `mini.nvim` (specifically `mini.misc`) to implement a custom loading strategy (`now`, `later`, `now_if_args`) for optimized startup performance.
- **AI Integration**: Heavily integrated with `sidekick.nvim` for Gemini and GitHub Copilot support, including next-edit suggestions.
- **LSP & Tooling**: Managed via `mason.nvim` and `nvim-lspconfig`, with `blink.cmp` for autocompletion.
- **UI & Utilities**: `snacks.nvim` (pickers, explorer, UI), `oil.nvim` (file management), `flash.nvim` (navigation), `bufferline.nvim` (tabs).

### Modular Directory Structure
- `init.lua`: The entry point. Defines the global `Config` table and loading helpers.
- `plugin/`: Modular configuration files for specific features and plugins. Files in this directory are automatically loaded by Neovim.
- `after/ftplugin/`: Language-specific settings (e.g., `cpp.lua`, `markdown.lua`).
- `after/lsp/`: Specific LSP server configurations (e.g., `lua_ls.lua`, `ts_ls.lua`) used by `lspconfig`.
- `bench/`: Contains performance-related configurations or playground settings.

## 🚀 Building and Running

- **Starting Neovim**: Simply run `nvim` in the terminal.
- **Plugin Management**: Plugins are registered and loaded natively via `vim.pack.add`. 
- **Tool Management**: Run `:Mason` within Neovim to manage LSP servers, formatters, and linters.
- **Formatting**: The project uses `stylua`. You can run `conform.nvim` with `<leader>ff` to format the current buffer.

## ✍️ Development Conventions

### Coding Style
- **Indentation**: 3 spaces (`indent_width = 3` in `.stylua.toml`).
- **Formatting**: Managed via `stylua`.
- **Global Helpers**: A global `map` function is available via `_G.map(mode, keys, func, desc, expr)`.

### Configuration Patterns
- **Loading Helpers**: Use `Config.now(f)` for startup-critical code (colorschemes, statuslines) and `Config.later(f)` for everything else to keep startup fast.
- **Plugin Setup**: Plugin configurations should ideally be placed in `plugin/` or loaded via the `Config` helpers in `init.lua`.
- **LSP Setup**: New LSP configurations should be added as tables in `after/lsp/`.

### Keybindings (Leader: `<Space>`)
- **Search**: `<leader>sf` (files), `<leader>st` (text), `<leader>sk` (keymaps).
- **LSP**: `gd` (definition), `gr` (references), `gk` (hover), `<leader>rn` (rename), `<leader>ca` (code action).
- **AI**: `<leader>gm` (Gemini), `<leader>cp` (Copilot), `<leader>s.` (Sidekick CLI), `<tab>` (Next-edit suggestion).
- **UI**: `<leader>e` (Oil explorer), `<leader>so` (Symbols outline).

## 🤖 AI-Powered Workflow

The configuration is optimized for AI-assisted development using `sidekick.nvim`:
- **Next-Edit Suggestions**: Use `<tab>` to jump to or apply the next suggested edit.
- **Sidekick CLI**: Use `<leader>s.` or `<c-.>` to toggle and focus the AI assistant.
- **Multiple Engines**: Seamlessly switch between Gemini (`<leader>gm`) and Copilot (`<leader>cp`).

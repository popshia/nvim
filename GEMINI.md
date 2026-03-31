# Gemini Instruction Context - Neovim Configuration

This directory contains a modular, modern Neovim configuration written in Lua. It leverages high-performance plugins and the latest Neovim features (likely targeting Neovim 0.11+ due to the use of the experimental `vim.pack` API).

## Project Overview

- **Main Technologies**: Neovim, Lua, `vim.pack` (built-in package management), LSP, Treesitter.
- **Architecture**: 
  - `init.lua`: Minimal entry point, requiring core modules.
  - `lua/`: Core settings (`options.lua`, `keymaps.lua`, `autocommands.lua`).
  - `plugin/`: Plugin-specific configurations. Each file is automatically loaded by Neovim.
  - `after/lsp/`: Specialized configurations for individual Language Servers.
  - `after/ftplugin/`: Filetype-specific overrides (e.g., `cpp.lua`, `markdown.lua`).

## Building and Running

- **To start Neovim**: Just run `nvim`.
- **Plugin Management**: This configuration uses the built-in `vim.pack.add()` API. Plugins are added by URL directly in the `plugin/*.lua` files.
- **LSP Server Management**: Managed via `mason.nvim` and `mason-lspconfig.nvim`. Servers are automatically installed if not present.
- **Manual Installation**: Ensure dependencies like `ripgrep`, `fd`, and a Nerd Font are installed on the system.

## Development Conventions

- **Modular Configuration**: New plugins should be added to a new file in the `plugin/` directory.
- **LSP Configuration**: Server-specific settings should go into `after/lsp/<server_name>.lua`.
- **Keymapping**: Use the global `map()` function defined in `lua/keymaps.lua` for consistent keybinding definitions. The leader key is `<Space>`.
- **Code Style**: The project uses `stylua` for formatting (configuration in `.stylua.toml`). Adhere to the existing formatting when making changes.
- **Keymaps Documentation**: Always include a description (`desc`) in keymap definitions to ensure they show up in `which-key` or other UI helpers.

## Key Plugins & Functionalities

- **LSP**: `nvim-lspconfig`, `mason.nvim` for server management, `blink.cmp` for completion, `lsp_signature.nvim` for parameter hints.
- **UI**: `snacks.nvim` (pickers, notifications, lazygit), `lualine.nvim` (statusline), `bufferline.nvim` (tabs), `oil.nvim` (file explorer).
- **Navigation**: `flash.nvim` (jumping), `symbols.nvim` (outline), `oil.nvim` (directory editing).
- **Editing**: `conform.nvim` (formatting), `Comment.nvim`, `mini.surround`, `mini.splitjoin`.
- **Git**: `gitsigns.nvim` for hunk tracking, `snacks.nvim` for `lazygit` integration.

## Key Commands/Keymaps (Summary)

- `<leader>ff`: Format file (via `conform.nvim`).
- `<leader>e`: Toggle `oil.nvim` file explorer.
- `<leader>lg`: Open `lazygit` (via `snacks.nvim`).
- `gd`, `gr`, `gi`: LSP Go to definition/references/implementation.
- `gk`: Show hover documentation.
- `<leader>rn`: Rename symbol.
- `<leader>ca`: Code actions.
- `s`: Search/jump via `flash.nvim`.
- `H` / `L`: Previous/Next buffer.

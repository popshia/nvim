# GEMINI Project Overview: Neovim Configuration

This document provides a comprehensive overview of the Neovim configuration in this directory, intended for use by the Gemini AI assistant.

## Project Overview

This is a personal Neovim configuration designed for a modern and productive development workflow. It is built upon the `lazy.nvim` plugin manager, ensuring fast startup times by lazy-loading plugins. The configuration is written in Lua and follows a modular structure that separates concerns, making it easy to maintain and extend.

The configuration is highly customized with a wide range of plugins that enhance the editing experience, provide a polished user interface, and integrate seamlessly with external tools like Git and the Language Server Protocol (LSP).

### Key Technologies

-   **Editor:** Neovim
-   **Language:** Lua
-   **Plugin Manager:** `lazy.nvim`
-   **Primary Colorscheme:** `gruvbox-material`

### Core Features

-   **Lazy Loading:** All plugins are lazy-loaded for optimal performance.
-   **LSP Integration:** `nvim-lspconfig` and `mason.nvim` are used for automatic LSP server installation and management, providing features like go-to-definition, code actions, and diagnostics.
-   **Custom UI:** The UI is enhanced with `lualine.nvim` for the statusline, `bufferline.nvim` for tabs, and various other plugins for a visually appealing experience.
-   **Modular Structure:** The configuration is well-organized into `core` settings (options, keymaps, autocommands) and a `plugins` directory where each plugin has its own configuration file.

## File Structure

The configuration is organized as follows:

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

## Building and Running

This is a Neovim configuration and is not "built" in a traditional sense. To use it, you would typically clone this repository into your Neovim configuration directory (`~/.config/nvim` on Linux/macOS).

When Neovim is started for the first time after cloning, `lazy.nvim` will automatically install all the plugins listed in the configuration.

## Development Conventions

The configuration follows a set of conventions that make it easy to manage:

-   **Plugin Management:** All plugins are managed through `lazy.nvim`. To add a new plugin, a new Lua file should be created in the `lua/user/plugins/` directory.
-   **Modularity:** Each plugin has its own configuration file in `lua/user/plugins/`, making it easy to configure or disable individual plugins.
-   **Keymaps:** Global keymaps are defined in `lua/user/core/keymaps.lua`. Plugin-specific keymaps are typically defined within the plugin's configuration file. The leader key is set to `<Space>`.
-   **Options:** Core Neovim options are set in `lua/user/core/options.lua`.
-   **LSP Configuration:** LSP servers are automatically installed via `mason.nvim` based on the `ensure_installed` list in `lua/user/plugins/mason.lua`.

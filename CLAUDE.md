# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

- **Start Neovim**: `nvim`
- **Format Lua files**: `stylua <file>` or `stylua .` (uses `.stylua.toml`: 3-space indent, 120-col width)
- **Format buffer inside Neovim**: `<leader>ff` (conform.nvim)
- **Manage LSP/formatters**: `:Mason` inside Neovim
- **Manage plugins**: `:Pack` inside Neovim (custom UI over `vim.pack`)

## Architecture

This config uses **Neovim 0.12+'s native `vim.pack.add()`** — no external plugin manager (no lazy.nvim, no packer).

### Loading Lifecycle

`init.lua` bootstraps `mini.nvim` first (since `mini.misc` provides the loading helpers), then exposes four global helpers:

```lua
now(f)           -- run immediately at startup (colorscheme, statusline, dashboard)
later(f)         -- defer until after startup (most plugins)
now_if_args(f)   -- now() if opened with a file arg, otherwise later()
on_event(ev, f)  -- run once on first matching Neovim event
on_filetype(ft, f) -- run once on first matching filetype
```

Every `plugin/*.lua` file uses these helpers to wrap `vim.pack.add()` + `require(...).setup()`. Files in `plugin/` are auto-loaded by Neovim; numbering (`00-`, `10-`, `20-`) controls load order for core settings.

### Directory Layout

| Path | Role |
|------|------|
| `init.lua` | Entry point: global `Config` table, loading helpers, autocommand helpers, `gh()` URL shorthand |
| `plugin/00-colorscheme.lua` | gruvbox-material (runs via `now()`) |
| `plugin/10-options.lua` | Vim options (leader=Space, UI, diagnostics) |
| `plugin/20-keymaps.lua` | Core keybindings |
| `plugin/30-autocommands.lua` | Custom autocommands |
| `plugin/*.lua` | One file per plugin/feature area |
| `after/lsp/*.lua` | Per-LSP-server settings consumed by nvim-lspconfig |
| `after/ftplugin/*.lua` | Filetype overrides |

### Global Helpers Defined in `init.lua`

```lua
_G.map(mode, keys, func, desc, expr)   -- keymap wrapper
_G.new_autocmd(event, pattern, once, callback, desc)  -- augroup-scoped autocmd
_G.on_packchanged(plugin_name, kinds, callback, desc) -- vim.pack hook helper
_G.gh(x)  -- returns "https://github.com/" .. x
```

### Adding a New Plugin

1. Call `vim.pack.add({ gh("owner/repo") })` inside a `later()` (or `now()` if startup-critical) block in a new `plugin/<name>.lua` file.
2. Place per-server LSP configs in `after/lsp/<server_name>.lua` — nvim-lspconfig picks them up automatically.
3. Use `on_packchanged("repo-name", {"add"}, setup_fn)` if setup must run after the plugin's first install.

## Code Style

- **Indentation**: 3 spaces (enforced by `.stylua.toml`)
- **Line width**: 120 columns
- **Quotes**: AutoPreferDouble
- **Requires sorted**: yes (stylua handles this)
- All keymaps use the global `map()` helper defined in `init.lua`

## Key Plugin Interactions

- **Diagnostics**: `tiny-inline-diagnostic.nvim` handles virtual text; it auto-disables when `sidekick.nvim` is showing suggestions (coordinated in `plugin/sidekick.lua`)
- **Completion**: `blink.cmp` + `LuaSnip`; Tab is claimed by sidekick next-edit suggestions, not completion
- **File operations**: `oil.nvim` renames trigger `snacks.rename` for LSP-aware file rename
- **Swift files**: `sourcekit-lsp` launched via `xcrun`; auto-read enabled with a 2s poll timer (in `after/lsp/`)
- **Formatting**: `conform.nvim` dispatches to `stylua` (Lua), `ruff` (Python), `prettier` (web), `swift-format` (Swift)

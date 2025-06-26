# My Neovim Configuration

This is my personal Neovim configuration, tailored for a productive and visually appealing development experience. It's built around a curated set of plugins managed by `lazy.nvim`.

## Features

- **Plugin Management:** Uses `lazy.nvim` for efficient and organized plugin management.
- **LSP Integration:** Comprehensive language server protocol (LSP) support for various languages, including Python, C++, Lua, and TypeScript/JavaScript.
- **Enhanced Editing:** Features like autocompletion, snippets, automatic formatting, and highlighting are provided by a combination of plugins.
- **Improved UI:** A customized statusline, bufferline, and color scheme for a better visual experience.
- **Keymap Hints:** `which-key.nvim` provides helpful keymap hints.

## Installation

1.  Clone this repository to your Neovim configuration directory:
    ```bash
    git clone https://github.com/popshia/nvim ~/.config/nvim
    ```
2.  Start Neovim. `lazy.nvim` will automatically install the configured plugins.

## Keymaps

### General

| Key | Description |
|---|---|
| `<Space>` | Leader key |
| `<Esc>` | Clear search highlighting |
| `<C-h/j/k/l>` | Focus window left/down/up/right |
| `<C-Up/Down>` | Resize window horizontally |
| `<C--/+>` | Resize window vertically |
| `J/K` | Move line down/up |
| `H/L` | Previous/Next buffer |
| `ycc` | Duplicate and comment line |
| `/` (in visual mode) | Search within visual selection |

### Plugins

| Key | Description | Plugin |
|---|---|---|
| `<leader>lz` | Show Lazy plugin manager | `lazy.nvim` |
| `<leader>ff` | Format file | `conform.nvim` |
| `<leader>;` | Pick symbols in winbar | `dropbar.nvim` |
| `s` | Flash jump | `flash.nvim` |
| `]g`/`[g` | Next/Previous git hunk | `gitsigns.nvim` |
| `<leader>gb` | Blame line | `gitsigns.nvim` |
| `<leader>gh` | Preview hunk | `gitsigns.nvim` |
| `n`/`N` | Next/Previous search (with hlslens) | `hlslens.nvim` |
| `[[`/`]]` | Previous/Next reference | `vim-illuminate` |
| `gd`/`gr`/`gi` | Go to definition/reference/implementation | `lsp-config` |
| `gk` | Hover documentation | `lsp-config` |
| `gs` | Signature help | `lsp-config` |
| `<leader>rn` | Rename | `lsp-config` |
| `<leader>ca` | Code actions | `lsp-config` |
| `<leader>li` | LSP info | `lsp-config` |
| `<leader>ms` | Show Mason | `mason.nvim` |
| `<leader>sj` | Toggle split/join | `mini.splitjoin` |
| `ys`/`ds`/`cs` | Add/delete/change surroundings | `mini.surround` |
| `<leader>i` | Toggle variable | `nvim-toggler` |
| `<leader>e` | Toggle file explorer | `oil.nvim` |
| `<leader>ds`/`ws` | Document/Workspace symbols | `snacks.nvim` |
| `<leader>sf`/`st`/`sr` | Search files/text/recent | `snacks.nvim` |
| `<leader>sk`/`si`/`sm` | Search keymaps/icons/notifications | `snacks.nvim` |
| `<leader>su`/`sb` | Undo history/Search buffers | `snacks.nvim` |
| `<leader>lg` | Lazygit | `snacks.nvim` |
| `<leader>gs`/`gl` | Git status/log | `snacks.nvim` |
| `<leader>sd` | Search todos | `snacks.nvim` |
| `<leader>sn` | Find Neovim files | `snacks.nvim` |
| `<leader>bd` | Delete buffer | `snacks.nvim` |
| `Q` | Delete buffer | `snacks.nvim` |
| `<leader>so` | Toggle symbol outline | `symbols.nvim` |
| `<c-\>` | Toggle terminal | `toggleterm.nvim` |
| `<leader>ls` | Toggle LSP diagnostics | `trouble.nvim` |
| `<leader>dd`/`wd` | Document/Workspace diagnostics | `trouble.nvim` |
| `<leader>qf` | Toggle quickfix list | `trouble.nvim` |
| `<leader>/` | Show buffer-local keymaps | `which-key.nvim` |

## Plugins Used

- **`lazy.nvim`**: Plugin manager.
- **`conform.nvim`**: Code formatting.
- **`dropbar.nvim`**: IDE-like breadcrumbs.
- **`flash.nvim`**: Quick text jumping.
- **`gitsigns.nvim`**: Git integration in the sign column.
- **`hlslens.nvim`**: Enhanced search highlighting.
- **`vim-illuminate`**: Highlights the word under the cursor.
- **`lsp-config`**: LSP configuration.
- **`lualine.nvim`**: Statusline.
- **`mason.nvim`**: LSP and tool installer.
- **`mini.nvim`**: A collection of minimal plugins.
- **`neoscroll.nvim`**: Smooth scrolling.
- **`nvim-toggler`**: Toggles text like `true`/`false`.
- **`oil.nvim`**: File manager.
- **`snacks.nvim`**: A collection of useful UI components.
- **`symbols.nvim`**: Symbol outline.
- **`toggleterm.nvim`**: Toggleable terminal.
- **`treesitter`**: Syntax highlighting and parsing.
- **`trouble.nvim`**: Diagnostic and list viewer.
- **`which-key.nvim`**: Keymap hints.
- And many more for autocompletion, colors, etc.

This README provides a high-level overview. For detailed configuration, please refer to the `.lua` files in this repository.

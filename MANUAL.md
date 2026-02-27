# Neovim Config — User Manual

> Personal config. Leader key: `<Space>`
> Neovim 0.11+ · macOS · lazy.nvim plugin manager

---

## Table of Contents

1. [Plugins](#plugins)
2. [Keymaps](#keymaps)
   - [General / Editor](#general--editor)
   - [Window Management](#window-management)
   - [Tab Management](#tab-management)
   - [File Explorer (nvim-tree)](#file-explorer)
   - [Fuzzy Finder (Telescope)](#fuzzy-finder)
   - [LSP](#lsp)
   - [Diagnostics](#diagnostics)
   - [Completion (blink.cmp)](#completion)
   - [Git (Gitsigns)](#git-hunks)
   - [Git UI (LazyGit)](#lazygit)
   - [Trouble (Diagnostics List)](#trouble)
   - [Formatting & Linting](#formatting--linting)
   - [Substitution](#substitution)
   - [Surround](#surround)
   - [Terminal](#terminal)
   - [Session Management](#session-management)
3. [LSP Servers & Tooling](#lsp-servers--tooling)
4. [Options Summary](#options-summary)

---

## Plugins

### UI & Appearance

| Plugin | Repo | What it does |
|--------|------|--------------|
| **tokyonight.nvim** | `folke/tokyonight.nvim` | Colorscheme (night style, custom dark palette) — default |
| **catppuccin** | `catppuccin/nvim` | Colorscheme (Mocha / Latte variants) |
| **kanagawa.nvim** | `rebelot/kanagawa.nvim` | Colorscheme (Wave / Dragon variants) |
| **rose-pine** | `rose-pine/neovim` | Colorscheme (Rose Pine / Moon variants) |
| **themery.nvim** | `zaldih/themery.nvim` | Interactive theme switcher with live preview, persists selection |
| **lualine.nvim** | `nvim-lualine/lualine.nvim` | Statusline with mode-color coding |
| **bufferline.nvim** | `akinsho/bufferline.nvim` | Tab bar (tabs mode) |
| **indent-blankline.nvim** | `lukas-reineke/indent-blankline.nvim` | Indent guide lines |
| **nvim-web-devicons** | `nvim-tree/nvim-web-devicons` | Nerd Font icons used by other plugins |
| **alpha-nvim** | `goolord/alpha-nvim` | Dashboard / startup screen with ASCII logo |
| **dressing.nvim** | `stevearc/dressing.nvim` | Better UI for `vim.ui.input` and `vim.ui.select` |

### Navigation & Search

| Plugin | Repo | What it does |
|--------|------|--------------|
| **telescope.nvim** | `nvim-telescope/telescope.nvim` | Fuzzy finder for files, grep, LSP symbols, etc. |
| **telescope-fzf-native** | `nvim-telescope/telescope-fzf-native.nvim` | Native C fzf sorter — faster matching |
| **nvim-tree.lua** | `nvim-tree/nvim-tree.lua` | File explorer sidebar |
| **vim-tmux-navigator** | `christoomey/vim-tmux-navigator` | Seamless `Ctrl-h/j/k/l` navigation across Vim splits and Tmux panes |

### LSP & Intelligence

| Plugin | Repo | What it does |
|--------|------|--------------|
| **nvim-lspconfig** | `neovim/nvim-lspconfig` | Configures Neovim's built-in LSP client |
| **mason.nvim** | `williamboman/mason.nvim` | Installs and manages LSP servers, linters, formatters |
| **mason-lspconfig.nvim** | `williamboman/mason-lspconfig.nvim` | Bridges mason and lspconfig for auto-setup |
| **mason-tool-installer.nvim** | `WhoIsSethDaniel/mason-tool-installer.nvim` | Auto-installs formatters and linters via mason |
| **lazydev.nvim** | `folke/lazydev.nvim` | Lua LSP annotations for Neovim API (replaces neodev) |
| **nvim-lsp-file-operations** | `antosha417/nvim-lsp-file-operations` | Notifies LSP when files are renamed/moved via nvim-tree |

### Completion

| Plugin | Repo | What it does |
|--------|------|--------------|
| **blink.cmp** | `saghen/blink.cmp` | Completion engine (Rust-powered). Sources: LSP, path, snippets, buffer |

### Syntax & Editing

| Plugin | Repo | What it does |
|--------|------|--------------|
| **nvim-treesitter** | `nvim-treesitter/nvim-treesitter` | Syntax highlighting, indentation, text objects via AST parsing |
| **nvim-ts-autotag** | `windwp/nvim-ts-autotag` | Auto-close and auto-rename HTML/JSX tags |
| **nvim-ts-context-commentstring** | `JoosepAlviste/nvim-ts-context-commentstring` | Correct comment syntax in embedded languages (e.g., JSX inside JS) |
| **nvim-autopairs** | `windwp/nvim-autopairs` | Auto-close brackets, quotes, etc. Treesitter-aware |
| **nvim-surround** | `kylechui/nvim-surround` | Add, change, delete surrounding delimiters (quotes, brackets, tags) |
| **substitute.nvim** | `gbprod/substitute.nvim` | Replace motion target with register contents |

### Formatting & Linting

| Plugin | Repo | What it does |
|--------|------|--------------|
| **conform.nvim** | `stevearc/conform.nvim` | Async formatter. Runs on save automatically |
| **nvim-lint** | `mfussenegger/nvim-lint` | Async linter. Runs on `BufEnter`, `BufWritePost`, `InsertLeave` |

### Git

| Plugin | Repo | What it does |
|--------|------|--------------|
| **gitsigns.nvim** | `lewis6991/gitsigns.nvim` | Git diff signs in gutter, hunk actions, inline blame |
| **lazygit.nvim** | `kdheepak/lazygit.nvim` | Opens LazyGit in a floating terminal window |

### Diagnostics & Notes

| Plugin | Repo | What it does |
|--------|------|--------------|
| **trouble.nvim** | `folke/trouble.nvim` | Pretty diagnostic/quickfix/loclist panel |
| **todo-comments.nvim** | `folke/todo-comments.nvim` | Highlights `TODO`, `FIXME`, `HACK`, `NOTE`, etc. in code |

### Workflow

| Plugin | Repo | What it does |
|--------|------|--------------|
| **toggleterm.nvim** | `akinsho/toggleterm.nvim` | Integrated terminal toggle (horizontal split, 15 lines) |
| **auto-session** | `rmagatti/auto-session` | Saves and restores sessions per working directory |
| **which-key.nvim** | `folke/which-key.nvim` | Shows pending keymap hints after 500 ms |
| **plenary.nvim** | `nvim-lua/plenary.nvim` | Lua utility library (required by telescope, lazygit, etc.) |

---

## Keymaps

### General / Editor

| Key | Mode | Action |
|-----|------|--------|
| `jk` | Insert | Exit insert mode (alternative to `<Esc>`) |
| `<leader>nh` | Normal | Clear search highlights |
| `<leader>th` | Normal | Open theme switcher (Themery) |

### Window Management

| Key | Mode | Action |
|-----|------|--------|
| `<leader>sv` | Normal | Split window vertically |
| `<leader>sh` | Normal | Split window horizontally |
| `<leader>se` | Normal | Equalize split sizes |
| `<leader>sx` | Normal | Close current split |
| `<leader>sm` | Normal | Toggle maximize/restore current split |
| `<C-h>` | Normal | Move to left split (or Tmux pane) |
| `<C-j>` | Normal | Move to lower split (or Tmux pane) |
| `<C-k>` | Normal | Move to upper split (or Tmux pane) |
| `<C-l>` | Normal | Move to right split (or Tmux pane) |

### Tab Management

| Key | Mode | Action |
|-----|------|--------|
| `<leader>to` | Normal | Open new tab |
| `<leader>tx` | Normal | Close current tab |
| `<leader>tn` | Normal | Go to next tab |
| `<leader>tp` | Normal | Go to previous tab |
| `<leader>tf` | Normal | Open current buffer in new tab |

### File Explorer

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ee` | Normal | Toggle file explorer |
| `<leader>ef` | Normal | Focus explorer on current file |
| `<leader>ec` | Normal | Collapse all folders in explorer |
| `<leader>er` | Normal | Refresh file explorer |

**Inside nvim-tree:**

| Key | Action |
|-----|--------|
| `<CR>` / `o` | Open file or expand folder |
| `v` | Open in vertical split |
| `h` | Open in horizontal split |
| `a` | Create file or directory |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `H` | Toggle hidden files |
| `q` | Close explorer |

### Fuzzy Finder

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | Normal | Find files in cwd |
| `<leader>fr` | Normal | Recent files |
| `<leader>fs` | Normal | Live grep (search string in cwd) |
| `<leader>fc` | Normal | Grep string under cursor |
| `<leader>ft` | Normal | Find TODO comments |

**Inside Telescope picker:**

| Key | Action |
|-----|--------|
| `<C-j>` | Move to next result |
| `<C-k>` | Move to previous result |
| `<C-q>` | Send selected to quickfix list |
| `<Esc>` | Close picker |

### LSP

> These keymaps are active only when an LSP server is attached to the buffer.

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition (Telescope) |
| `gD` | Normal | Go to declaration |
| `gR` | Normal | Show all references (Telescope) |
| `gi` | Normal | Show implementations (Telescope) |
| `gt` | Normal | Show type definitions (Telescope) |
| `K` | Normal | Show hover documentation |
| `<leader>ca` | Normal / Visual | Code actions |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>rs` | Normal | Restart LSP server |

### Diagnostics

| Key | Mode | Action |
|-----|------|--------|
| `<leader>d` | Normal | Show line diagnostics (float) |
| `<leader>D` | Normal | Show all buffer diagnostics (Telescope) |
| `[d` | Normal | Go to previous diagnostic |
| `]d` | Normal | Go to next diagnostic |

### Trouble

| Key | Mode | Action |
|-----|------|--------|
| `<leader>xw` | Normal | Toggle workspace diagnostics panel |
| `<leader>xd` | Normal | Toggle document diagnostics panel |
| `<leader>xq` | Normal | Toggle quickfix list in Trouble |
| `<leader>xl` | Normal | Toggle location list in Trouble |
| `<leader>xt` | Normal | Toggle TODO list in Trouble |

### Completion

> blink.cmp — active in insert mode when completion menu is open.

| Key | Action |
|-----|--------|
| `<C-j>` | Select next completion item |
| `<C-k>` | Select previous completion item |
| `<CR>` | Accept selected completion |
| `<C-Space>` | Show / toggle completion menu |
| `<C-e>` | Hide / cancel completion |
| `<C-b>` | Scroll documentation up |
| `<C-f>` | Scroll documentation down |

### Git Hunks

> Gitsigns — active when inside a git repository.

| Key | Mode | Action |
|-----|------|--------|
| `]h` | Normal | Jump to next hunk |
| `[h` | Normal | Jump to previous hunk |
| `<leader>hs` | Normal | Stage hunk under cursor |
| `<leader>hs` | Visual | Stage selected lines |
| `<leader>hr` | Normal | Reset hunk under cursor |
| `<leader>hr` | Visual | Reset selected lines |
| `<leader>hS` | Normal | Stage entire buffer |
| `<leader>hR` | Normal | Reset entire buffer |
| `<leader>hu` | Normal | Undo last stage |
| `<leader>hp` | Normal | Preview hunk diff |
| `<leader>hb` | Normal | Show full blame for current line |
| `<leader>hB` | Normal | Toggle inline blame on current line |
| `<leader>hd` | Normal | Diff this file against index |
| `<leader>hD` | Normal | Diff this file against last commit |
| `ih` | Operator / Visual | Text object: select hunk |

### LazyGit

| Key | Mode | Action |
|-----|------|--------|
| `<leader>lg` | Normal | Open LazyGit |

### Formatting & Linting

| Key | Mode | Action |
|-----|------|--------|
| `<leader>mp` | Normal / Visual | Format file (or selected range) |
| `<leader>l` | Normal | Trigger linter on current file |

> Formatting also runs automatically on save for all configured filetypes.

### Substitution

| Key | Mode | Action |
|-----|------|--------|
| `s{motion}` | Normal | Replace motion target with register |
| `ss` | Normal | Replace entire line with register |
| `S` | Normal | Replace to end of line with register |
| `s` | Visual | Replace selection with register |

### Surround

> nvim-surround default bindings.

| Key | Mode | Action |
|-----|------|--------|
| `ys{motion}{char}` | Normal | Add surrounding `{char}` around motion |
| `ds{char}` | Normal | Delete surrounding `{char}` |
| `cs{old}{new}` | Normal | Change surrounding from `{old}` to `{new}` |
| `S{char}` | Visual | Surround selection with `{char}` |

**Examples:**
- `ysiw"` — surround word with double quotes
- `ds(` — delete surrounding parentheses
- `cs'"` — change surrounding `'` to `"`
- `ysat` — surround with an HTML tag (prompts for tag name)

### Terminal

| Key | Mode | Action |
|-----|------|--------|
| `<leader>j` | Normal | Toggle terminal (horizontal split) |
| `<C-\>` | Terminal | Toggle terminal (close from inside) |

### Session Management

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ws` | Normal | Save session for current directory |
| `<leader>wr` | Normal | Restore session for current directory |

---

## LSP Servers & Tooling

### LSP Servers (managed by Mason)

| Language | Server | Notes |
|----------|--------|-------|
| Python | **pyright** | Strict type checking, no auto-import organizer |
| C / C++ | **clangd** | Background indexing, clang-tidy, LLVM style |
| Lua | **lua_ls** | Configured with Neovim globals via lazydev |

### Formatters (conform.nvim, run on save)

| Formatter | Filetypes |
|-----------|-----------|
| **prettier** | JS, TS, JSX, TSX, Svelte, CSS, HTML, JSON, YAML, Markdown, GraphQL, Liquid |
| **stylua** | Lua |
| **isort** | Python (import sorting, runs first) |
| **black** | Python (formatting, runs after isort) |

### Linters (nvim-lint, run async)

| Linter | Filetypes |
|--------|-----------|
| **eslint_d** | JS, TS, JSX, TSX, Svelte |
| **pylint** | Python |

---

## Options Summary

| Option | Value | Effect |
|--------|-------|--------|
| `number` + `relativenumber` | true | Hybrid line numbers |
| `tabstop` / `shiftwidth` | 2 | 2-space indentation |
| `expandtab` | true | Tabs → spaces |
| `wrap` | false | No line wrapping |
| `ignorecase` + `smartcase` | true | Smart case-insensitive search |
| `cursorline` | true | Highlight current line |
| `termguicolors` | true | 24-bit color support |
| `signcolumn` | "yes" | Always show gutter (no layout shift) |
| `clipboard` | unnamedplus | System clipboard as default register |
| `splitright` / `splitbelow` | true | New splits open right / below |
| `updatetime` | 250 ms | Faster gitsigns / LSP hover response |
| `undofile` | true | Persistent undo across sessions |
| `scrolloff` | 8 | Keep 8 lines visible above/below cursor |
| `isfname` | includes `@-@` | `gf` works on scoped paths like `@scope/pkg` |

---

*Config lives at `~/.config/nvim/`. Plugin files: `lua/sthita/plugins/`. Core settings: `lua/sthita/core/`.*

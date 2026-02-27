# Neovim Config — AI Context

Personal Neovim configuration. Design goals: **lightweight, fast, not bloated**.

## Environment

- Neovim: 0.11.6 (Homebrew, Apple Silicon)
- OS: macOS (Darwin 25.3.0)
- Plugin manager: lazy.nvim (stable branch)
- Leader key: `<Space>`

## Directory Structure

```
~/.config/nvim/
├── init.lua                          # Entry point — loads core + lazy
├── lazy-lock.json
└── lua/sthita/
    ├── core/
    │   ├── init.lua                  # Requires options + keymaps
    │   ├── options.lua               # vim.opt settings
    │   └── keymaps.lua               # Core keymaps (splits, tabs, etc.)
    ├── lazy.lua                      # lazy.nvim bootstrap + setup
    └── plugins/
        ├── init.lua                  # Bare deps: plenary, vim-tmux-navigator
        │                             # NOTE: also has a bare treesitter entry
        │                             # (duplicate of treesitter.lua — remove it)
        ├── lsp/
        │   └── init.lua              # mason + lspconfig + mason-lspconfig
        │                             # + mason-tool-installer + neodev
        ├── treesitter.lua            # Treesitter (real config lives here)
        ├── colorscheme.lua           # tokyonight (dark, customized)
        ├── telescope.lua             # Fuzzy finder + fzf-native
        ├── nvim-cmp.lua              # Completion engine + luasnip stack
        ├── lsp/init.lua              # LSP, mason, formatters
        ├── comment.lua               # Comment.nvim + ts-context-commentstring
        ├── nvim-tree.lua             # File explorer
        ├── autopairs.lua             # nvim-autopairs
        ├── surround.lua              # nvim-surround
        ├── substitute.lua            # substitute.nvim
        ├── linting.lua               # nvim-lint (eslint_d, pylint)
        ├── formatting.lua            # conform.nvim (prettier, stylua, black/isort)
        ├── gitsigns.lua              # Git hunk signs + blame
        ├── lazygit.lua               # lazygit.nvim (<leader>lg)
        ├── lualine.lua               # Statusline
        ├── bufferline.nvim           # Tabline (mode = "tabs")
        ├── indent-blankline.lua      # Indent guides
        ├── todo-comments.lua         # TODO/FIXME highlighting
        ├── trouble.lua               # Diagnostic list
        ├── dressings.lua             # dressing.nvim (better UI inputs)
        ├── which-key.lua             # Keymap guide
        ├── vim-maximizer.lua         # Window maximizer (candidate for removal)
        ├── alpha.lua                 # Dashboard / startup screen
        ├── auto-session.lua          # Session save/restore
        └── terminal.lua              # toggleterm.nvim
```

## Full Plugin Inventory

| Plugin | Purpose | Status |
|---|---|---|
| lazy.nvim | Plugin manager | OK |
| nvim-treesitter | Syntax / indent / select | OK |
| nvim-ts-autotag | Auto-close HTML tags | OK |
| plenary.nvim | Lua utilities (dep) | OK |
| vim-tmux-navigator | Tmux/split navigation | OK |
| tokyonight.nvim | Colorscheme | OK |
| dressing.nvim | Better input/select UI | OK |
| which-key.nvim | Keymap guide | OK |
| lualine.nvim | Statusline | OK |
| bufferline.nvim | Tabline (tabs mode) | OK |
| indent-blankline.nvim | Indent guides | OK |
| nvim-web-devicons | Icons | OK |
| nvim-tree.lua | File explorer | OK |
| telescope.nvim | Fuzzy finder | OK |
| telescope-fzf-native | Native sorter | OK |
| nvim-autopairs | Auto-close brackets | OK |
| nvim-surround | Surround text objects | OK |
| substitute.nvim | Substitution motions | OK |
| Comment.nvim | Comment toggling | CANDIDATE FOR REMOVAL (Nvim 0.10+ has native gc) |
| nvim-ts-context-commentstring | JSX/TSX comment context | Keep (needed for native gc too) |
| nvim-cmp | Completion engine | CANDIDATE FOR REPLACEMENT → blink.cmp |
| LuaSnip | Snippet engine | CANDIDATE FOR REMOVAL (blink.cmp handles this) |
| cmp_luasnip | LuaSnip cmp source | CANDIDATE FOR REMOVAL |
| friendly-snippets | VS Code snippets | CANDIDATE FOR REMOVAL |
| cmp-buffer | Buffer text source | CANDIDATE FOR REMOVAL |
| cmp-path | Path source | CANDIDATE FOR REMOVAL |
| lspkind.nvim | Completion icons | CANDIDATE FOR REMOVAL (blink has built-in) |
| cmp-nvim-lsp | LSP source for cmp | CANDIDATE FOR REMOVAL |
| mason.nvim | LSP/tool installer | OK |
| mason-lspconfig.nvim | Mason↔lspconfig bridge | OK |
| mason-tool-installer.nvim | Auto-install formatters | OK |
| nvim-lspconfig | LSP client config | OK |
| nvim-lsp-file-operations | LSP rename for nvim-tree | OK |
| neodev.nvim | Lua LSP for nvim config | DEPRECATED → replace with lazydev.nvim |
| nvim-lint | Async linting | OK |
| conform.nvim | Formatting | OK |
| gitsigns.nvim | Git diff/blame | OK |
| lazygit.nvim | Lazygit integration | OK |
| trouble.nvim | Diagnostic list | OK |
| todo-comments.nvim | TODO highlighting | OK |
| toggleterm.nvim | Integrated terminal | OK |
| auto-session | Session management | OK (minor config fixes needed) |
| alpha-nvim | Dashboard | OK |
| vim-maximizer | Window maximize | CANDIDATE FOR REMOVAL (replace with inline Lua) |

## LSP Configuration

Servers managed by mason:
- **pyright** — Python (strict type checking — currently misconfigured, see bugs)
- **clangd** — C/C++ (background-index, clang-tidy, llvm style)
- **lua_ls** — Lua/Neovim config

Formatters (conform.nvim):
- JS/TS/JSX/TSX/Svelte/CSS/HTML/JSON/YAML/Markdown/GraphQL/Liquid → prettier
- Lua → stylua
- Python → isort, then black

Linters (nvim-lint):
- JS/TS/JSX/TSX/Svelte → eslint_d
- Python → pylint

## Known Bugs (discovered during audit)

### BUG 1: LSP completions silently not working
**File:** `lua/sthita/plugins/nvim-cmp.lua:47-51`
**Problem:** `nvim-cmp` sources list includes `luasnip`, `buffer`, `path` — but is missing `{ name = "nvim_lsp" }`. LSP-powered completions (functions, methods, classes) are not appearing even though the LSP is connected.
**Fix:** Add `{ name = "nvim_lsp" }` as first entry in sources.

### BUG 2: Pyright type checking settings ignored
**File:** `lua/sthita/plugins/lsp/init.lua:116-121`
**Problem:** `typeCheckingMode = "strict"` and `reportMissingImports = true` are nested under the `pyright` table, but they must be under `python.analysis`. Pyright silently ignores them.
**Fix:**
```lua
settings = {
  pyright = { disableOrganizeImports = true },
  python = {
    analysis = {
      typeCheckingMode = "strict",
      reportMissingImports = true,
    },
  },
},
```

## Pending Improvements (approved for implementation)

### P1 — Deprecated plugin replacements
- [ ] Replace `neodev.nvim` → `lazydev.nvim` (`lsp/init.lua:20`)
- [ ] Fix `vim.loop` → `vim.uv` in `lazy.lua:2` (deprecated since Nvim 0.10)

### P2 — Structural cleanup
- [ ] Remove bare `nvim-treesitter` entry from `plugins/init.lua:2` (duplicate spec)

### P3 — Performance (biggest wins)
- [ ] Replace nvim-cmp stack (7 plugins) → `blink.cmp` (1-2 plugins, Rust-powered, faster)
  - Removes: nvim-cmp, LuaSnip, cmp_luasnip, friendly-snippets, cmp-buffer, cmp-path, lspkind, cmp-nvim-lsp
- [ ] Remove `Comment.nvim` — use Neovim 0.11 native `gc`/`gcc` operator
  - Keep `nvim-ts-context-commentstring`, wire it into native commenter via `vim.g.skip_ts_context_commentstring_module = false`
- [ ] Remove `vim-maximizer` — replace with ~6-line inline Lua toggle in keymaps

### P4 — Silence startup warnings (options.lua)
- [ ] Add provider disables to avoid loading unused remote plugin providers:
  ```lua
  vim.g.loaded_python3_provider = 0
  vim.g.loaded_ruby_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_node_provider = 0
  ```

### P5 — lazy.nvim config
- [ ] Add `rocks = { enabled = false }` to lazy setup (no plugins use luarocks)

### P6 — Missing options
- [ ] `opt.updatetime = 250` (default 4000ms — makes gitsigns/LSP hover sluggish)
- [ ] `opt.undofile = true` (persistent undo — off by default, very useful)
- [ ] `opt.scrolloff = 8` (keep cursor away from screen edges)
- [ ] `opt.isfname:append("@-@")` (fix `gf` on scoped paths like `@scope/pkg`)

### P7 — auto-session fixes
- [ ] Update deprecated config key names (checkhealth warns about old names)
- [ ] Add `localoptions` to `sessionoptions` so filetype/highlight restore correctly

### P8 — Modernize diagnostic signs API
- [ ] Replace `vim.fn.sign_define` calls in `lsp/init.lua:89-93` with
  `vim.diagnostic.config({ signs = { text = { ERROR = "…", … } } })`

### P9 — Tooling
- [ ] `brew install fd` (telescope uses ripgrep fallback without it)

## Key Keymaps Reference

| Key | Action |
|---|---|
| `<leader>ff` | Telescope find files |
| `<leader>fs` | Telescope live grep |
| `<leader>fr` | Recent files |
| `<leader>ft` | Find TODOs |
| `<leader>lg` | LazyGit |
| `<leader>j` | Toggle terminal |
| `<leader>mp` | Format buffer |
| `<leader>l` | Trigger linter |
| `<leader>wr` / `<leader>ws` | Session restore / save |
| `gd` / `gR` / `gi` / `gt` | LSP definitions/refs/impl/types |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `]h` / `[h` | Next/prev git hunk |
| `<C-h/j/k/l>` | Window/tmux navigation |

## Conventions

- Plugin specs are one file per plugin (except bare deps in `plugins/init.lua`)
- LSP config lives in `plugins/lsp/init.lua` (mason + lspconfig combined)
- Formatting and linting are separate files (`formatting.lua`, `linting.lua`)
- No auto-commit, no pushing without explicit user request
- Always read files before editing; prefer Edit over Write for existing files
- When suggesting changes, list them first and wait for approval before coding

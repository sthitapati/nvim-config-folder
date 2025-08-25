return {
  -- Mason for LSP server management and automatic installation
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- nvim-lspconfig for configuring Neovim's built-in LSP client
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",          -- LSP source for nvim-cmp
      { "antosha417/nvim-lsp-file-operations", config = true }, -- LSP file operations
      { "folke/neodev.nvim", opts = {} },                      -- Neovim development support
      { "nvim-telescope/telescope.nvim" },                      -- For LSP definitions/references keybindings
    },
    config = function()
      -- import lspconfig plugin
      local lspconfig = require("lspconfig")

      -- import mason_lspconfig plugin
      local mason_lspconfig = require("mason-lspconfig")

      local mason_tool_installer = require("mason-tool-installer")

      -- import cmp-nvim-lsp plugin
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap -- for conciseness

      -- Autocommand to set up keybindings when an LSP client attaches to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings for LSP actions.
          local opts = { buffer = ev.buf, silent = true }

          opts.desc = "Show LSP references"
          keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

          opts.desc = "Go to declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

          opts.desc = "Show LSP definitions"
          keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

          opts.desc = "Show LSP implementations"
          keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

          opts.desc = "Show LSP type definitions"
          keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

          opts.desc = "See available code actions"
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

          opts.desc = "Smart rename"
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

          opts.desc = "Show buffer diagnostics"
          keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

          opts.desc = "Show line diagnostics"
          keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

          opts.desc = "Go to previous diagnostic"
          keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

          opts.desc = "Go to next diagnostic"
          keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

          opts.desc = "Show documentation for what is under cursor"
          keymap.set("n", "K", vim.lsp.buf.hover, opts)

          opts.desc = "Restart LSP"
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        end,
      })

      -- Used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Auto-install formatters and linters
      mason_tool_installer.setup({
        ensure_installed = {
          "prettier", -- prettier formatter
          "stylua",   -- lua formatter
          "isort",    -- python formatter
          "black",    -- python formatter
          "pylint",   -- python linter 
          "eslint_d"  -- js linter
        },
      })

      mason_lspconfig.setup({
        -- list of servers you want to automatically install
        ensure_installed = { "pyright", "clangd", "lua_ls" },
        -- Setup handlers for Mason-LSPconfig
        handlers = {
          -- Configure pyright for Python
          ["pyright"] = function()
            lspconfig.pyright.setup({
              capabilities = capabilities,
              settings = {
                pyright = {
                  disableOrganizeImports = true,
                  typeCheckingMode = "strict",
                  reportMissingImports = true,
                },
              },
            })
          end,
          -- Configure clangd for C/C++
          ["clangd"] = function()
            lspconfig.clangd.setup({
              capabilities = capabilities,
              cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--fallback-style=llvm",
              },
              filetypes = {
                "c",
                "cpp",
                "h",
                "hpp",
              },
            })
          end,
          -- Configure lua_ls for Neovim configuration files
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                  completion = {
                    callSnippet = "Replace",
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
}

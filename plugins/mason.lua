local path = require "plenary.path"
local null_ls = require "null-ls"
local scan = require'plenary.scandir'

-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        -- Lua
        "lua_ls",

        -- Php
        "intelephense",

        -- Configs
        "yamlls",
        "jsonls",
        "lemminx",

        -- Markdown
        "zk",

        -- Js
        "eslint",

        -- Web
        "html",
        "cssls",

        -- Docker
        "dockerls",

        -- Scripts
        "bashls",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        -- Lua
        "stylua",

        -- Php
        "phpcs",
        "phpcbf",

        -- Web
        "prettier",
      },
      handlers = {
        phpcs = function()
          local matched = scan.scan_dir('.', { hidden = true, depth = 3, search_pattern = 'phpcs.xml' })
          local standard = path:new(matched[1])

          null_ls.register(null_ls.builtins.diagnostics.phpcs.with {
            prefer_local = "vendor/bin",
            extra_args = {
              "--standard=" .. (standard:exists() and standard:absolute() or "PSR12"),
            },
          })
        end,
        phpcbf = function()
          local matched = scan.scan_dir('.', { hidden = true, depth = 3, search_pattern = 'phpcs.xml' })
          local standard = path:new(matched[1])

          null_ls.register(null_ls.builtins.formatting.phpcbf.with {
            prefer_local = "vendor/bin",
            extra_args = {
              "--standard=" .. (standard:exists() and standard:absolute() or "PSR12"),
            },
          })
        end,
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}

local path = require "plenary.path"
local null_ls = require "null-ls"
local scan = require "plenary.scandir"

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

        -- Web
        "tsserver",
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
        "eslint_d",
        "prettierd",
      },
      handlers = {
        phpcs = function()
          local matched = scan.scan_dir(".", { hidden = true, depth = 3, search_pattern = "phpcs.xml" })
          local standard = path:new(matched[1])

          null_ls.register(null_ls.builtins.diagnostics.phpcs.with {
            prefer_local = "vendor/bin",
            extra_args = {
              "--standard=" .. (standard:exists() and standard:absolute() or "PSR12"),
            },
          })
        end,
        phpcbf = function()
          local matched = scan.scan_dir(".", { hidden = true, depth = 3, search_pattern = "phpcs.xml" })
          local standard = path:new(matched[1])

          null_ls.register(null_ls.builtins.formatting.phpcbf.with {
            prefer_local = "vendor/bin",
            extra_args = {
              "--standard=" .. (standard:exists() and standard:absolute() or "PSR12"),
            },
          })
        end,
        prettierd = function()
          null_ls.register(null_ls.builtins.formatting.prettierd.with {
            condition = function(util)
              return util.root_has_file "package.json"
                  or util.root_has_file ".prettierrc"
                  or util.root_has_file ".prettierrc.json"
                  or util.root_has_file ".prettierrc.js"
                  and not util.root_has_file "composer.json"
            end,
          })
        end,
        eslint_d = function()
          null_ls.register(null_ls.builtins.diagnostics.eslint_d.with {
            condition = function(util)
              return util.root_has_file "package.json"
                  or util.root_has_file ".eslintrc.json"
                  or util.root_has_file ".eslintrc.js"
                  and not util.root_has_file "composer.json"
            end,
          })
        end,
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = { "js" },
    },
  },
}

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
        "phpcbf",

        -- Web
        "prettier",
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

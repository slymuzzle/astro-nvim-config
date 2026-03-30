return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.filetypes = vim.tbl_deep_extend("force", opts.filetypes or {}, {
        extension = {
          pg = "sql",
          drift = "sql",
        },
      })

      if opts.treesitter.ensure_installed ~= "all" then
        opts.treesitter.ensure_installed =
          require("astrocore").list_insert_unique(opts.treesitter.ensure_installed, { "sql" })
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "sql" })
      end
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "sqlfluff" })
      opts.handlers = opts.handlers or {}

      opts.handlers.sqlfluff = function()
        local null_ls = require "null-ls"
        local defaultDialect = "ansi"
        null_ls.register(null_ls.builtins.diagnostics.sqlfluff.with {
          extra_args = { "--dialect", defaultDialect },
        })
        null_ls.register(null_ls.builtins.formatting.sqlfluff.with {
          extra_args = { "--dialect", defaultDialect },
        })
      end
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "sqlfluff" })
    end,
  },
}

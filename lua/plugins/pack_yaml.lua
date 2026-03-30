---@type LazySpec
return {
  {
    "b0o/schemastore.nvim",
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      config = {
        yamlls = {
          on_new_config = function(config)
            local schemas = require("schemastore").yaml.schemas()
            config.settings.yaml.schemas = vim.tbl_deep_extend("force", config.settings.yaml.schemas or {}, schemas)
          end,
          settings = { yaml = { schemaStore = { enable = false, url = "" } } },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "yaml" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "yamlls" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "yaml-language-server" })
    end,
  },
}

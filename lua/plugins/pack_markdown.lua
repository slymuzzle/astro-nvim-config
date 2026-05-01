---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      if opts.treesitter.ensure_installed ~= "all" then
        opts.treesitter.ensure_installed = require("astrocore").list_insert_unique(
          opts.treesitter.ensure_installed,
          { "markdown", "markdown_inline", "latex" }
        )
      end
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "marksman" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "marksman" })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    cmd = "RenderMarkdown",
    ft = function()
      local plugin = require("lazy.core.config").spec.plugins["render-markdown.nvim"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      return opts.file_types or { "markdown" }
    end,
    opts = {},
  },
}

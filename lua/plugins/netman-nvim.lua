---@type LazySpec
return {
  "miversen33/netman.nvim",
  cmd = "Neotree",
  opts = {},
  specs = {
    {
      "nvim-neo-tree/neo-tree.nvim",
      dependencies = { "netman.nvim" },
      optional = true,
      opts = function(_, opts)
        opts.sources = require("astrocore").list_insert_unique(opts.sources, { "netman.ui.neo-tree" })
        table.insert(
          opts.source_selector.sources,
          { display_name = require("astroui").get_icon("CodeRemote", 1, true) .. "Remote", source = "remote" }
        )
      end,
    },
  },
}

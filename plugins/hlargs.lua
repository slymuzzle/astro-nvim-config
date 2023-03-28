return {
  "m-demare/hlargs.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "BufRead",
  config = function()
    local C = require "astrotheme.palettes.astrodark"

    require("hlargs").setup {
      color = C.dark_orange,
    }
  end,
}

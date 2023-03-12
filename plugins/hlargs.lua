return {
  "m-demare/hlargs.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "BufRead",
  config = function() require("hlargs").setup() end,
}

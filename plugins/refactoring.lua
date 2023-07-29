local prefix = "<leader>r"

return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  opts = {},
  keys = {
    {
      prefix .. "e",
      [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
      { silent = true, expr = false },
      mode = {
        "v",
      },
      desc = "Extract Function",
    },
    {
      prefix .. "f",
      [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
      { silent = true, expr = false },
      mode = {
        "v",
      },
      desc = "Extract Function To File",
    },
    {
      prefix .. "v",
      [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
      { silent = true, expr = false },
      mode = {
        "v",
      },
      desc = "Extract Variable",
    },
    {
      prefix .. "i",
      [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
      { silent = true, expr = false },
      mode = {
        "v",
      },
      desc = "Inline Variable",
    },
    {
      prefix .. "b",
      function() require("refactoring").refactor "Extract Block" end,
      { silent = true, expr = false },
      mode = {
        "n",
      },
      desc = "Extract Block",
    },
    {
      prefix .. "bf",
      function() require("refactoring").refactor "Extract Block To File" end,
      { silent = true, expr = false },
      mode = {
        "n",
      },
      desc = "Extract Block To File",
    },
    {
      prefix .. "i",
      function() require("refactoring").refactor "Inline Variable" end,
      { silent = true, expr = false },
      mode = { "n" },
      desc = "Inline Variable",
    },
    {
      prefix .. "r",
      function() require("refactoring").select_refactor() end,
      { silent = true, expr = false },
      desc = "Select Refactor",
    },
    {
      prefix .. "p",
      function() require("refactoring").debug.printf { below = false } end,
      mode = { "n" },
      desc = "Debug: Print Function",
    },
    {
      prefix .. "v",
      function() require("refactoring").debug.print_var { normal = true, below = false } end,
      mode = { "n" },
      desc = "Debug: Print Variable",
    },
    {
      prefix .. "v",
      function() require("refactoring").debug.print_var { below = false } end,
      mode = { "v" },
      desc = "Debug: Print Variable",
    },
    {
      prefix .. "c",
      function() require("refactoring").debug.cleanup {} end,
      mode = { "n" },
      desc = "Debug: Clean Up",
    },
  },
}

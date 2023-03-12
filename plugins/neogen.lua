local prefix = "<leader>a"

return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("neogen").setup {
      snippet_engine = "luasnip",
      languages = {
        lua = { template = { annotation_convention = "ldoc" } },
        python = { template = { annotation_convention = "google_docstrings" } },
        typescript = { template = { annotation_convention = "tsdoc" } },
        typescriptreact = { template = { annotation_convention = "tsdoc" } },
        php = { template = { annotation_convention = "phpdoc" } },
      },
    }
  end,
  keys = {
    { prefix, desc = "Annotation" },
    { prefix .. "<cr>", function() require("neogen").generate { type = "current" } end, desc = "Current" },
    { prefix .. "c", function() require("neogen").generate { type = "class" } end, desc = "Class" },
    { prefix .. "f", function() require("neogen").generate { type = "func" } end, desc = "Function" },
    { prefix .. "t", function() require("neogen").generate { type = "type" } end, desc = "Type" },
    { prefix .. "F", function() require("neogen").generate { type = "file" } end, desc = "File" },
  },
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}

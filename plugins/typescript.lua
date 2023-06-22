return {
  "jose-elias-alvarez/typescript.nvim",
  ft = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
  },
  opts = function() return { server = require("astronvim.utils.lsp").config "tsserver" } end,
}

local lsp = require "astronvim.utils.lsp"

return {
  "mickael-menu/zk-nvim",
  cmd = { "ZkNotes" },
  ft = "markdown",
  config = function()
    require("zk").setup {
      picker = "telescope",
      lsp = {
        config = lsp.config "zk",
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    }
  end,
  keys = {
    { "<leader>fN", "<cmd>ZkNotes<cr>", desc = "Find notes" },
  },
}

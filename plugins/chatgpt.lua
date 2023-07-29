local prefix = "<leader>G"

return {
  "jackMort/ChatGPT.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = {
    "ChatGPT",
    "ChatGPTActAs",
    "ChatGPTEditWithInstructions",
  },
  config = function() require("chatgpt").setup {} end,
  keys = {
    { prefix .. "o", "<cmd>ChatGPT<cr>", desc = "Open interactive window" },
    { prefix .. "a", "<cmd>ChatGPTActAs<cr>", desc = "Act as" },
    { prefix .. "e", "<cmd>ChatGPTEditWithInstructions<cr>", desc = "Edit with instructions" },
  },
}

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  n = {
    -- Base
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },

    -- Buffers
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<S-Right>"] = {
      function() require("astronvim.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Move buffer tab right",
    },
    ["<S-Left>"] = {
      function() require("astronvim.utils.buffer").move(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Move buffer tab left",
    },

    -- ChatGPT
    ["<leader>G"] = { name = " ChatGPT" },
    ["<leader>Go"] = { "<cmd>ChatGPT<cr>", desc = "Open interactive window" },
    ["<leader>Ga"] = { "<cmd>ChatGPTActAs<cr>", desc = "Act as" },
    ["<leader>Ge"] = { "<cmd>ChatGPTEditWithInstructions<cr>", desc = "Edit with instructions" },
  },
  t = {
    ["<esc>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
  },
}

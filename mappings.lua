-- Mapping data with "desc" stored directly by vim.keymap.set().
local get_icon = require("astronvim.utils").get_icon
local toggle_term_cmd = require("astronvim.utils").toggle_term_cmd

-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  n = {
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
    ["<leader>G"] = { name = get_icon("Tentacle", 1, true) .. "ChatGPT" },

    --- Refactoring
    ["<leader>r"] = { name = get_icon("PuzzleEdit", 1, true) .. "Refactoring" },

    --- RestNvim
    ["<leader>R"] = { name = get_icon("Web", 1, true) .. "Rest" },

    --- Annotation
    ["<leader>a"] = { name = get_icon("FileDocumentEditOutline", 1, true) .. "Annotation" },

    --- Lazygit
    ["<leader>td"] = {
      function()
        if vim.fn.executable "lazydocker" == 1 then toggle_term_cmd "lazydocker" end
      end,
      desc = "ToggleTerm lazydocker",
    },

    --- Lazygit
    ["<leader>tk"] = {
      function()
        if vim.fn.executable "k9s" == 1 then toggle_term_cmd "k9s" end
      end,
      desc = "ToggleTerm k9s",
    },
  },
  t = {
    ["<esc>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
  },
}

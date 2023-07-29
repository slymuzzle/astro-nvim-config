local prefix = "<leader>u"

return {
  "xiyaowong/transparent.nvim",
  opts = {
    extra_groups = {
      "NormalFloat",
      "FloatBorder",
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "NeoTreeHeader",
      "NeoTreeTabInactive",
      "NeoTreeTabSeparatorInactive",
      "WinBar",
      "WinBarNC",
      "CursorLine",
      "StatusLine",
    },
  },
  cmd = { "TransparentToggle" },
  keys = {
    { prefix .. "T", "<cmd>TransparentToggle<cr>", desc = "Toggle transparency" },
  },
}

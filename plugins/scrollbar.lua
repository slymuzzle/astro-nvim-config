return {
  "petertriho/nvim-scrollbar",
  event = "User AstroFile",
  config = function()
    require("scrollbar").setup {
      hide_if_all_visible = true,
      max_lines = 10000,
      excluded_buftypes = {
        "terminal",
        "prompt",
        "nofile",
        "help",
        "quickfix",
      },
      excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "NvimTree",
        "neo-tree",
        "toggleterm",
        "alpha",
        "dashboard",
        "Outline",
      },
      handle = {
        highlight = "CursorColumn",
      },
      marks = {
        Search = {
          highlight = "IncSearch",
        },
        Error = {
          highlight = "DiagnosticError",
        },
        Warn = {
          highlight = "DiagnosticWarn",
        },
        Info = {
          highlight = "DiagnosticInfo",
        },
        Hint = {
          highlight = "DiagnosticHint",
        },
        Misc = {
          highlight = "Normal",
        },
      },
      handlers = {
        gitsigns = require("astronvim.utils").is_available "gitsigns",
        search = require("astronvim.utils").is_available "hlslens",
        ale = require("astronvim.utils").is_available "ale",
      },
    }
  end,
}

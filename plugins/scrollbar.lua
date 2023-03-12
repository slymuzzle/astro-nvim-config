return {
  "petertriho/nvim-scrollbar",
  event = "BufRead",
  config = function()
    require("scrollbar").setup {
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
        cursor = true,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = true,   -- Requires hlslens
      },
    }
  end,
}

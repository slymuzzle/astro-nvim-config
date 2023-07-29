local utils = require "astronvim.utils"

local c = utils.extend_tbl(require "astrotheme.palettes.astrodark", {
  syntax = {
    yellow = "#e5c06b",
  }
})

return function(hl)
  -- Base
  hl.Type = { fg = c.syntax.yellow, bg = c.none }

  -- Treesitter
  hl["@field.yaml"] = { fg = c.syntax.blue }

  -- NeoTree
  -- hl.NeoTreeNormal = { bg = c.ui.base }
  -- hl.NeoTreeNormalNC = { bg = c.ui.base }
  -- hl.NeoTreeHeader = { bg = c.ui.base, fg = c.syntax.blue }
  -- hl.NeoTreeTabInactive = { bg = c.ui.base, fg = c.syntax.blue }
  -- hl.NeoTreeTabSeparatorInactive = { bg = c.ui.base, fg = c.ui.base }
  -- hl.NeoTreeTabActive = { bg = c.ui.tabline, fg = c.syntax.blue, bold = true }
  -- hl.NeoTreeTabSeparatorActive = { bg = c.ui.tabline, fg = c.ui.tabline }

  -- Hlslens
  hl.Search = { fg = c.syntax.orange, underline = true }
  hl.IncSearch = { fg = c.syntax.yellow }
  hl.WildMenu = { fg = c.syntax.orange }

  -- Leap
  hl.LeapMatch = { fg = c.syntax.text, bold = true }
  hl.LeapLabelPrimary = { fg = c.syntax.yellow }
  hl.LeapLabelSecondary = { fg = c.syntax.orange, underline = true }
  hl.LeapLabelSelected = { fg = c.syntax.blue }
  hl.LeapBackdrop = { link = "Comment" }

  return hl
end

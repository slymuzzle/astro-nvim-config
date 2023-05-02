local utils = require "astronvim.utils"

local C = utils.extend_tbl(require "astrotheme.palettes.astrodark", {
  --
})

return function(hl)
  -- Base
  hl.Type = { fg = C.yellow, bg = C.none }

  -- Treesitter
  hl["@field.yaml"] = { fg = C.blue }

  -- NeoTree
  hl.NeoTreeNormal = { bg = C.base }
  hl.NeoTreeNormalNC = { bg = C.base }
  hl.NeoTreeHeader = { bg = C.base, fg = C.blue }
  hl.NeoTreeTabInactive = { bg = C.base, fg = C.blue }
  hl.NeoTreeTabSeparatorInactive = { bg = C.base, fg = C.base }
  hl.NeoTreeTabActive = { bg = C.overlay1, fg = C.blue, bold = true }
  hl.NeoTreeTabSeparatorActive = { bg = C.overlay1, fg = C.overlay1 }

  -- Hlslens
  hl.Search = { fg = C.dark_orange, underline = true }
  hl.IncSearch = { fg = C.yellow }
  hl.WildMenu = { fg = C.dark_orange }

  -- Leap
  hl.LeapMatch = { fg = C.text, bold = true }
  hl.LeapLabelPrimary = { fg = C.yellow }
  hl.LeapLabelSecondary = { fg = C.dark_orange, underline = true }
  hl.LeapLabelSelected = { fg = C.blue }
  hl.LeapBackdrop = { link = "Comment" }

  return hl
end

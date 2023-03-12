-- return function(hl) -- or a function that returns a new table of colors to set
--   local C = require "colors.astrodark"
--
--   hl.Normal = { fg = C.fg, bg = C.bg }
--
--   -- New approach instead of diagnostic_style
--   -- hl.DiagnosticError.italic = true
--   -- hl.DiagnosticHint.italic = true
--   -- hl.DiagnosticInfo.italic = true
--   -- hl.DiagnosticWarn.italic = true
--
--   -- TS
--   hl["@field"] = { fg = C.blue }
--   hl["@variable"] = { fg = C.fg }
--   hl["@parameter"] = { fg = C.fg }
--   hl["@variable.builtin"] = { fg = C.red }
--   hl["@property"] = { fg = C.cyan }
--   hl["@type"] = { fg = C.yellow }
--   hl["@operator"] = { fg = C.purple }
--   hl["@attribute"] = { fg = C.cyan }
--   hl["@tag"] = { fg = C.blue }
--   hl["@tag.attribute"] = { fg = C.orange }
--   hl["@tag.delimiter"] = { fg = C.grey_2 }
--   hl["@text.uri"] = { fg = C.blue }
--
--   -- NeoTree
--   hl.NeoTreeHeader = { bg = C.bg, fg = C.blue }
--   hl.NeoTreeTabInactive = { bg = C.bg, fg = C.blue }
--   hl.NeoTreeTabSeparatorInactive = { bg = C.bg, fg = C.bg }
--   hl.NeoTreeTabActive = { bg = C.bg_1, fg = C.blue, bold = true }
--   hl.NeoTreeTabSeparatorActive = { bg = C.bg_1, fg = C.bg_1 }
--
--   -- Hlslens
--   -- hl.Search = { fg = C.orange_1, underline = true }
--   -- hl.IncSearch = { fg = C.gold }
--   -- hl.WildMenu = { fg = C.orange_1 }
--
--   -- Leap
--   -- hl.LeapMatch = { fg = C.white, bold = true }
--   -- hl.LeapLabelPrimary = { fg = C.gold }
--   -- hl.LeapLabelSecondary = { fg = C.orange_1, underline = true }
--   -- hl.LeapLabelSelected = { fg = C.blue }
--   -- hl.LeapBackdrop = { link = 'Comment' }
--
--   return hl
-- end

local utils = require "astronvim.utils"

local C = utils.extend_tbl(require "astrotheme.palettes.astrodark", {
  fg = "#abb2bf",
  bg = "#1e222a",
  white = "#dedede",
})

return function(hl)
  -- Base
  hl.Normal = { fg = C.fg, bg = C.bg }

  -- TS
  hl["@field"] = { fg = C.blue }
  hl["@variable"] = { fg = C.fg }
  hl["@parameter"] = { fg = C.fg }
  hl["@variable.builtin"] = { fg = C.red }
  hl["@property"] = { fg = C.cyan }
  hl["@type"] = { fg = C.yellow }
  hl["@operator"] = { fg = C.purple }
  hl["@attribute"] = { fg = C.cyan }
  hl["@tag"] = { fg = C.blue }
  hl["@tag.attribute"] = { fg = C.orange }
  hl["@tag.delimiter"] = { fg = C.grey_2 }
  hl["@text.uri"] = { fg = C.blue }

  -- NeoTree
  hl.NeoTreeHeader = { bg = C.bg, fg = C.blue }
  hl.NeoTreeTabInactive = { bg = C.bg, fg = C.blue }
  hl.NeoTreeTabSeparatorInactive = { bg = C.bg, fg = C.bg }
  hl.NeoTreeTabActive = { bg = C.bg_1, fg = C.blue, bold = true }
  hl.NeoTreeTabSeparatorActive = { bg = C.bg_1, fg = C.bg_1 }

  -- Hlslens
  hl.Search = { fg = C.orange_1, underline = true }
  hl.IncSearch = { fg = C.gold }
  hl.WildMenu = { fg = C.orange_1 }

  -- Leap
  hl.LeapMatch = { fg = C.white, bold = true }
  hl.LeapLabelPrimary = { fg = C.gold }
  hl.LeapLabelSecondary = { fg = C.orange_1, underline = true }
  hl.LeapLabelSelected = { fg = C.blue }
  hl.LeapBackdrop = { link = 'Comment' }

  return hl
end

local utils = require "astronvim.utils"

local C = utils.extend_tbl(require "astrotheme.palettes.astrodark", {
  --
})

return function(hl)
  -- Comment
  hl.Comment = { fg = C.subtext1, bg = C.none } -- any comment

  -- Constant
  hl.Constant = { fg = C.yellow, bg = C.none } -- any constant
  hl.String = { fg = C.green, bg = C.none } -- a string constant: "this is a string"
  hl.Character = { fg = C.green, bg = C.none } -- a character constant: 'c', '\n'
  hl.Number = { fg = C.orange, bg = C.none } -- a number constant: 234, 0xff
  hl.Boolean = { fg = C.blue, bg = C.none } -- a boolean constant: TRUE, false
  hl.Float = { fg = C.yellow, bg = C.none } -- a floating point constant: 2.3e10

  -- Identifier
  hl.Identifier = { fg = C.text, bg = C.none } -- any variable name
  hl.Function = { fg = C.blue, bg = C.none } -- function name (also: methods for classes)

  -- Statement
  hl.Statement = { fg = C.purple, bg = C.none } -- any statement
  hl.Conditional = { fg = C.light_purple, bg = C.none } -- if, then, else, endif, switch, etc.
  hl.Repeat = { fg = C.purple, bg = C.none } -- for, do, while, etc.
  hl.Label = { fg = C.blue, bg = C.none } -- case, default, etc.
  hl.Operator = { fg = C.white, bg = C.none } -- "sizeof", "+", "*", etc.
  hl.Keyword = { fg = C.purple, bg = C.none } -- any other keyword
  hl.Exception = { fg = C.purple, bg = C.none } -- try, catch, throw

  -- Preproc
  hl.PreProc = { fg = C.yellow, bg = C.none } -- generic Preprocessor
  hl.Include = { fg = C.purple, bg = C.none } -- preprocessor #include
  hl.Define = { fg = C.purple, bg = C.none } -- preprocessor #define
  hl.Macro = { fg = C.orange, bg = C.none } -- same as Define
  hl.PreCondit = { fg = C.blue, bg = C.none } -- preprocessor #if, #else, #endif, etc.

  -- Type
  hl.Type = { fg = C.blue, bg = C.none } -- int, long, char, etc.
  hl.StorageClass = { fg = C.yellow, bg = C.none } -- static, register, volatile, etc.
  hl.Structure = { fg = C.purple, bg = C.none } -- struct, union, enum, etc.
  hl.Typedef = { fg = C.yellow, bg = C.none } -- A typedef

  -- Special
  hl.Special = { fg = C.blue, bg = C.none } -- any special symbol
  hl.SpecialChar = { fg = C.blue, bg = C.none } -- special character in a constant
  hl.Tag = { fg = C.blue, bg = C.none } -- you can use CTRL-] on this
  hl.Delimiter = { fg = C.blue, bg = C.none } -- character that needs attention
  hl.SpecialComment = { fg = C.grey, bg = C.none } -- special things inside a comment
  hl.Debug = { fg = C.blue, bg = C.none } -- debugging statements

  -- Underlined
  hl.Underlined = { fg = C.cyan, bg = C.none } -- text that stands out, HTML links

  -- Ignore
  hl.Ignore = { fg = C.none, bg = C.none } -- left blank, hidden  |hl-Ignore|

  -- Error
  hl.Error = { fg = C.red, bg = C.none } -- any erroneous construct

  -- Todo
  hl.Todo = { fg = C.purple, bg = C.none } -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  -- Treesitter
  hl["@annotation"] = { fg = C.yellow }
  hl["@attribute"] = { fg = C.yellow }
  hl["@boolean"] = { fg = C.orange }
  hl["@character"] = { fg = C.green }
  hl["@conditional"] = { fg = C.purple }
  hl["@constant"] = { fg = C.yellow }
  hl["@constant.builtin"] = { fg = C.orange }
  hl["@constant.macro"] = { fg = C.red }
  hl["@constant.rust"] = { fg = C.cyan }
  hl["@constructor"] = { fg = C.yellow }
  hl["@error"] = { fg = C.red }
  hl["@exception"] = { fg = C.purple }
  hl["@field"] = { fg = C.blue }
  hl["@float"] = { fg = C.orange }
  hl["@function"] = { fg = C.blue }
  hl["@function.builtin"] = { fg = C.blue }
  hl["@function.macro"] = { fg = C.yellow }
  hl["@function.macro.rust"] = { fg = C.orange }
  hl["@include"] = { fg = C.purple }
  hl["@keyword"] = { link = "Keyword" }
  hl["@keyword.function"] = { link = "Keyword" }
  hl["@keyword.function.rust"] = { fg = C.orange }
  hl["@keyword.operator"] = { link = "Keyword" }
  hl["@label"] = { fg = C.blue }
  hl["@literal.markdown"] = { fg = C.green }
  hl["@method"] = { fg = C.blue }
  hl["@namespace"] = { link = "Keyword" }
  hl["@namespace.rust"] = { fg = C.yellow }
  hl["@none.markdown"] = { fg = C.text }
  hl["@number"] = { fg = C.orange }
  hl["@parameter"] = { fg = C.text }
  hl["@parameter.reference"] = { fg = C.cyan }
  hl["@property"] = { fg = C.cyan }
  hl["@punctuation.bracket"] = { fg = C.text }
  hl["@punctuation.delimiter"] = { fg = C.text }
  hl["@punctuation.delimiter.markdown"] = { fg = C.text }
  hl["@punctuation.special"] = { fg = C.text }
  hl["@punctuation.special.markdown"] = { fg = C.red }
  hl["@repeat"] = { fg = C.purple }
  hl["@string"] = { fg = C.green }
  hl["@string.escape"] = { fg = C.red }
  hl["@string.regex"] = { fg = C.green }
  hl["@tag"] = { fg = C.blue }
  hl["@tag.attribute"] = { fg = C.orange }
  hl["@tag.delimiter"] = { fg = C.subtext1 }
  hl["@text"] = { fg = C.text }
  hl["@text.emphasis"] = { fg = C.purple, italic = true }
  hl["@text.literal"] = { fg = C.text }
  hl["@text.reference"] = { fg = C.yellow }
  hl["@text.strong"] = { fg = C.blue, bold = true }
  hl["@text.title"] = { fg = C.text }
  hl["@text.underline"] = { fg = C.text }
  hl["@text.uri"] = { fg = C.green }
  hl["@title.markdown"] = { fg = C.red }
  hl["@type"] = { fg = C.yellow }
  hl["@type.builtin"] = { fg = C.yellow }
  hl["@type.qualifier.typescript"] = { link = "Keyword" }
  hl["@type.rust"] = { fg = C.yellow }
  hl["@variable"] = { fg = C.text }
  hl["@variable.builtin"] = { fg = C.red }

  -- Treesitter old
  -- hl["@keyword"] = { fg = C.purple }
  -- hl["@keyword.operator"] = { fg = C.purple }
  -- hl["@namespace"] = { fg = C.purple, bg = C.none }
  -- hl["@field"] = { fg = C.blue, bg = C.none }
  -- hl["@variable"] = { fg = C.text, bg = C.none }
  -- hl["@parameter"] = { fg = C.text, bg = C.none }
  -- hl["@variable.builtin"] = { fg = C.red, bg = C.none }
  -- hl["@property"] = { fg = C.cyan, bg = C.none }
  -- hl["@type"] = { fg = C.yellow, bg = C.none }
  -- hl["@operator"] = { fg = C.purple, bg = C.none }
  -- hl["@attribute"] = { fg = C.cyan, bg = C.none }
  -- hl["@tag"] = { fg = C.blue, bg = C.none }
  -- hl["@tag.attribute"] = { fg = C.orange, bg = C.none }
  -- hl["@tag.delimiter"] = { fg = C.subtext1, bg = C.none }
  -- hl["@text.uri"] = { fg = C.blue, bg = C.none }

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

-- local snacks = require "snacks"
local astroui = require "astroui"
-- local cowsay = require "custom.cowsay"

local function getGreeting(name)
  local tableTime = os.date "*t"
  local hour = tableTime.hour
  local greetingsTable = {
    [1] = astroui.get_icon("Bed", 2, true) .. "Sleep well",
    [2] = astroui.get_icon("Morning", 2, true) .. "Good morning",
    [3] = astroui.get_icon("Afternoon", 2, true) .. "Good afternoon",
    [4] = astroui.get_icon("Evening", 2, true) .. "Good evening",
    [5] = astroui.get_icon("Night", 2, true) .. "Good night",
  }

  local greetingIndex = nil
  if hour == 23 or hour < 7 then
    greetingIndex = 1
  elseif hour < 12 then
    greetingIndex = 2
  elseif hour >= 12 and hour < 18 then
    greetingIndex = 3
  elseif hour >= 18 and hour < 21 then
    greetingIndex = 4
  elseif hour >= 21 then
    greetingIndex = 5
  end

  local greeting = greetingsTable[greetingIndex] .. ", " .. name

  return greeting
end

-- local header = table.concat({
--   "       ███████ ██   ██    ██    ",
--   "       ██      ██    ██  ██     ",
--   "       ███████ ██     ████      ",
--   "            ██ ██      ██       ",
--   "       ███████ ███████ ██       ",
--   "",
--   "███    ██ ██    ██ ██ ███    ███",
--   "████   ██ ██    ██ ██ ████  ████",
--   "██ ██  ██ ██    ██ ██ ██ ████ ██",
--   "██  ██ ██  ██  ██  ██ ██  ██  ██",
--   "██   ████   ████   ██ ██      ██",
-- }, "\n")

local small_header = table.concat({
  "███████ ██   ██    ██   ███    ██ ██    ██ ██ ███    ███",
  "██      ██    ██  ██    ████   ██ ██    ██ ██ ████  ████",
  "███████ ██     ████     ██ ██  ██ ██    ██ ██ ██ ████ ██",
  "     ██ ██      ██      ██  ██ ██  ██  ██  ██ ██  ██  ██",
  "███████ ███████ ██      ██   ████   ████   ██ ██      ██",
}, "\n")

---@type LazySpec
return {
  "folke/snacks.nvim",
  ---@param _ any
  ---@param opts snacks.Config
  opts = function(_, opts)
    local greeting = getGreeting(os.getenv "USER")

    -- local padding = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.1) }

    -- if vim.o.lines < 36 then
    --   header = small_header
    --   greeting = {}
    --   padding = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.25) }
    -- end

    opts.dashboard = {
      preset = {
        header = small_header,
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
        { pane = 2, text = greeting, padding = 1, indent = 14 },
        {
          pane = 2,
          section = "terminal",
          cmd = "krabby name snorlax --no-title",
          height = 21,
          width = 38,
          indent = 4,
        },
        -- { pane = 2, text = table.concat(greeting, "\n"), padding = 1 },
        -- { section = "greeting" },
        -- { section = "footer" },
        -- { section = "startup" },
      },
    }

    opts.scroll = {
      -- your scroll configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end,
}

local function getGreeting(name)
  local ui = require "astroui"

  local tableTime = os.date "*t"
  local hour = tableTime.hour

  local greetingsTable = {
    [1] = ui.get_icon("Bed", 2, true) .. "Sleep well",
    [2] = ui.get_icon("Morning", 2, true) .. "Good morning",
    [3] = ui.get_icon("Afternoon", 2, true) .. "Good afternoon",
    [4] = ui.get_icon("Evening", 2, true) .. "Good evening",
    [5] = ui.get_icon("Night", 2, true) .. "Good night",
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

local small_header = table.concat({
  "███████ ██   ██    ██   ███    ██ ██    ██ ██ ███    ███",
  "██      ██    ██  ██    ████   ██ ██    ██ ██ ████  ████",
  "███████ ██     ████     ██ ██  ██ ██    ██ ██ ██ ████ ██",
  "     ██ ██      ██      ██  ██ ██  ██  ██  ██ ██  ██  ██",
  "███████ ███████ ██      ██   ████   ████   ██ ██      ██",
}, "\n")

---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    ---@param _ any
    opts = function(_, opts)
      local greeting = getGreeting(os.getenv "USER")

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
            cmd = "krabby name snorlax --no-title; sleep 0.1",
            height = 21,
            width = 38,
            indent = 4,
          },
        },
      }
    end,
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        pets = {
          -- {
          --   event = "User",
          --   pattern = "SnacksDashboardOpened",
          --   callback = function()
          --     if vim.g.neovide then return end
          --     pets.call_pets()
          --   end,
          -- },
          -- {
          --   event = "User",
          --   pattern = "SnacksDashboardClosed",
          --   callback = function()
          --     if vim.g.neovide then return end
          --     pets.kill_pets()
          --   end,
          -- },
        },
      },
    },
  },
}

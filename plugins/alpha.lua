-- Extend Alpha configuration

local button = require("astronvim.utils").alpha_button
local get_icon = require("astronvim.utils").get_icon
local cow = require "user.custom-plugins.cowsay"

local function getGreeting(name)
  local tableTime = os.date "*t"
  local hour = tableTime.hour
  local greetingsTable = {
    [1] = get_icon("Bed", 2, true) .. "Sleep well",
    [2] = get_icon("Morning", 2, true) .. "Good morning",
    [3] = get_icon("Afternoon", 2, true) .. "Good afternoon",
    [4] = get_icon("Evening", 2, true) .. "Good evening",
    [5] = get_icon("Night", 2, true) .. "Good night",
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

  return cow.say(greeting)
end

local header = {
  "       ███████ ██   ██    ██",
  "       ██      ██    ██  ██",
  "       ███████ ██     ████",
  "            ██ ██      ██",
  "       ███████ ███████ ██",
  " ",
  "███    ██ ██    ██ ██ ███    ███",
  "████   ██ ██    ██ ██ ████  ████",
  "██ ██  ██ ██    ██ ██ ██ ████ ██",
  "██  ██ ██  ██  ██  ██ ██  ██  ██",
  "██   ████   ████   ██ ██      ██",
}

local small_header = {
  "███████ ██   ██    ██   ███    ██ ██    ██ ██ ███    ███",
  "██      ██    ██  ██    ████   ██ ██    ██ ██ ████  ████",
  "███████ ██     ████     ██ ██  ██ ██    ██ ██ ██ ████ ██",
  "     ██ ██      ██      ██  ██ ██  ██  ██  ██ ██  ██  ██",
  "███████ ███████ ██      ██   ████   ████   ██ ██      ██",
}

local greeting = getGreeting(os.getenv "USER")

local padding = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.1) }

if vim.o.lines < 36 then
  header = small_header
  greeting = {}
  padding = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.25) }
end

if vim.o.lines > 44 then padding = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.16) } end

return {
  "goolord/alpha-nvim",
  config = function()
    require("alpha").setup {
      layout = {
        { type = "padding", val = padding },
        {
          type = "text",
          val = header,
          opts = { position = "center", hl = "DashboardHeader" },
        },
        { type = "padding", val = 2 },
        {
          type = "group",
          val = {
            button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
            button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
            button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
            button("LDR f p", get_icon("FolderClosed", 2, true) .. "Projects  "),
            button("LDR f N", get_icon("Notebook", 2, true) .. "Notes  "),
            button("LDR f a", get_icon("Gear", 2, true) .. "Settings  "),
          },
          opts = { spacing = 1 },
        },
        {
          type = "text",
          val = greeting,
          opts = { position = "center", hl = "DashboardCenter" },
        },
      },
    }
  end,
}

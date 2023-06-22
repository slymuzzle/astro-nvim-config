-- Extend Alpha configuration

local button = require("astronvim.utils").alpha_button

local cow = require "user.custom-plugins.cowsay"

local function getGreeting(name)
  local tableTime = os.date "*t"
  local hour = tableTime.hour
  local greetingsTable = {
    [1] = "  Sleep well",
    [2] = "  Good morning",
    [3] = "  Good afternoon",
    [4] = "  Good evening",
    [5] = "󰖔 Good night",
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

if vim.o.lines > 44 then
  padding = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.16) }
end

return {
  "goolord/alpha-nvim",
  config = function ()
    require'alpha'.setup({
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
            button("LDR n", "  New File  "),
            button("LDR f f", "  Find File  "),
            button("LDR f o", "󰅐  Recents  "),
            button("LDR f p", "  Projects  "),
            button("LDR f N", "󰠮  Notes  "),
            button("LDR f a", "  Settings  "),
          },
          opts = { spacing = 1 },
        },
        {
          type = "text",
          val = greeting,
          opts = { position = "center", hl = "DashboardCenter" },
        },
      },
    })
  end
}

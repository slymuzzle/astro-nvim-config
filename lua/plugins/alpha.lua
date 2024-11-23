---@type LazySpec
return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local get_icon = require("astroui").get_icon
    local cow = require "custom.cowsay"

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

    opts.section.header.val = header
    opts.section.footer.val = greeting

    opts.config.layout = {
      { type = "padding", val = padding },
      opts.section.header,
      { type = "padding", val = 2 },
      opts.section.buttons,
      {
        type = "text",
        val = greeting,
        opts = { position = "center", hl = "DashboardCenter" },
      },
    }
    opts.config.opts.noautocmd = false
  end,
}

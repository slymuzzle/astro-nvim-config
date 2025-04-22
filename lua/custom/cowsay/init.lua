local strings = require "plenary.strings"

local function border(text, char) return string.rep(char, strings.strdisplaywidth(text) + 2) end

local function split(s, delimiter)
  local result = {}
  for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

local M = {}

function M.say(text)
  local cows_table = require "custom.cowsay.cows-table"
  math.randomseed(os.time())
  return split(string.format(cows_table[math.random(#cows_table)], border(text, "_"), text, border(text, "-")), "\n")
end

return M

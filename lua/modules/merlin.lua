local M = {}

local function get_file_paths_from_node(node)
  local selected_path = node:get_id()
  if node.type ~= "directory" then return { selected_path } end

  local file_paths = {}
  local entries = vim.fn.globpath(selected_path, "**/*", false, true)
  for _, path in ipairs(entries) do
    if vim.fn.filereadable(path) == 1 then table.insert(file_paths, path) end
  end
  table.sort(file_paths)
  return file_paths
end

local function ensure_chat()
  local cc = require "codecompanion"
  local chat = cc.last_chat()
  if chat then return chat end

  vim.cmd "CodeCompanionChat"
  return cc.last_chat()
end

local function append_file_to_chat(chat, file_path)
  local constants = require("codecompanion.config").config.constants
  local chat_helpers = require "codecompanion.interactions.chat.helpers"
  local ok, description, id = pcall(chat_helpers.format_file_for_llm, file_path)
  if not ok or not description or not id then return end

  local context = chat.context
  local has_context = context and type(context.add) == "function"
  local opts = {
    visible = false,
    _meta = { tag = "file" },
  }
  if has_context then opts.context = { id = id, path = file_path } end

  chat:add_message({
    role = constants.USER_ROLE,
    content = description,
  }, opts)

  if has_context then
    context:add {
      id = id,
      path = file_path,
      source = "codecompanion.interactions.chat.slash_commands.builtin.file",
    }
  end
end

function M.add_node_to_chat(node)
  if not node then return end

  local file_paths = get_file_paths_from_node(node)
  if #file_paths == 0 then return end

  local chat = ensure_chat()
  if not chat then return end

  for _, file_path in ipairs(file_paths) do
    append_file_to_chat(chat, file_path)
  end
end

function M.add_statusline_component(opts)
  opts.statusline = opts.statusline or {}

  local astroui = require "astroui.status.hl"
  local component = {
    static = {
      n_requests = 0,
      spinner_index = 0,
      spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
      done_symbol = "󰸞",
    },
  }

  local function redraw_statusline() vim.cmd "redrawstatus" end

  local function register_request_autocmds(self)
    if self._cc_autocmds then return end
    self._cc_autocmds = true

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestStarted",
      callback = function()
        self.n_requests = self.n_requests + 1
        redraw_statusline()
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestFinished",
      callback = function()
        self.n_requests = math.max(0, self.n_requests - 1)
        redraw_statusline()
      end,
    })
  end

  local function current_symbol(self)
    if self.n_requests == 0 then
      self.spinner_index = 0
      return self.done_symbol
    end

    self.spinner_index = (self.spinner_index % #self.spinner_symbols) + 1
    return self.spinner_symbols[self.spinner_index]
  end

  component.init = register_request_autocmds
  component.provider = function(self)
    if not package.loaded["codecompanion"] then return nil end
    return (" 󱙺 (%d) %s "):format(self.n_requests, current_symbol(self))
  end
  component.hl = function() return astroui.filetype_color() end

  table.insert(opts.statusline, component)
end

return M

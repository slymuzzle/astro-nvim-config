-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.api.nvim_create_user_command("AstroOpts", function(opts)
  local name = opts.args
  local p = require("lazy.core.config").plugins[name]
  if not p then
    vim.notify("Plugin not found: " .. name, vim.log.levels.ERROR)
    return
  end
  local merged = require("lazy.core.plugin").values(p, "opts", false)

  vim.cmd "tabnew"
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  vim.bo.filetype = "lua"
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(vim.inspect(merged), "\n"))
  vim.bo.modifiable = false
end, {
  nargs = 1,
  complete = function(arg_lead)
    local keys = vim.tbl_keys(require("lazy.core.config").plugins)
    table.sort(keys)
    return vim.tbl_filter(function(name) return name:find("^" .. vim.pesc(arg_lead)) ~= nil end, keys)
  end,
})

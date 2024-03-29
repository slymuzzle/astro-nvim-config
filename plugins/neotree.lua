local function on_file_remove(args)
  local ts_clients = vim.lsp.get_active_clients { name = "tsserver" }
  for _, ts_client in ipairs(ts_clients) do
    ts_client.request("workspace/executeCommand", {
      command = "_typescript.applyRenameFile",
      arguments = {
        {
          sourceUri = vim.uri_from_fname(args.source),
          targetUri = vim.uri_from_fname(args.destination),
        },
      },
    })
  end
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    local events = require "neo-tree.events"

    opts.event_handlers = {
      {
        event = events.FILE_MOVED,
        handler = on_file_remove,
      },
      {
        event = events.FILE_RENAMED,
        handler = on_file_remove,
      },
    }

    opts.window.mappings.oc = false -- order_by_created
    opts.window.mappings.od = false -- order_by_diagnostics
    opts.window.mappings.og = false -- order_by_git_status
    opts.window.mappings.om = false -- order_by_modified
    opts.window.mappings.on = false -- order_by_name
    opts.window.mappings.os = false -- order_by_size
    opts.window.mappings.ot = false -- order_by_type

    return opts
  end,
}

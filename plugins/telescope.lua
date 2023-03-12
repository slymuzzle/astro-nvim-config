local telescope = require("telescope")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "debugloop/telescope-undo.nvim",
    "ahmedkhalf/project.nvim",
  },
  config = function(plugin, opts)
    require("plugins.configs.telescope")(plugin, opts)
    telescope.load_extension("undo")
    telescope.load_extension("projects")
  end,
  keys = {
    {"<leader>fu", function() require("telescope").extensions.undo.undo() end, desc = "Find undo history" },
    {"<leader>fp", function() require("telescope").extensions.projects.projects() end, desc = "Find projects" },
  },
}

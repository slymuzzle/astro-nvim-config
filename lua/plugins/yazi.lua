---@type LazySpec
return {
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    cmd = "Yazi",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "?",
      },
      integrations = {
        grep_in_directory = "snacks.picker",
        grep_in_selected_files = "snacks.picker",
      },
    },
  },

  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      if not opts.mappings then opts.mappings = {} end
      opts.mappings.n = opts.mappings.n or {}
      opts.mappings.v = opts.mappings.v or {}
      opts.mappings.n["<Leader>y"] = { desc = "Yazi" }
      opts.mappings.n["<Leader>-"] = { "<Cmd>Yazi<CR>", desc = "Open yazi at current file" }
      opts.mappings.v["<Leader>-"] = { "<Cmd>Yazi<CR>", desc = "Open yazi at selection" }
      opts.mappings.n["<Leader>yc"] = { "<Cmd>Yazi cwd<CR>", desc = "Open yazi in cwd" }
      opts.mappings.n["<Leader>yy"] = { "<Cmd>Yazi toggle<CR>", desc = "Resume yazi session" }
    end,
  },
}

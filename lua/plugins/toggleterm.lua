local core = require "astrocore"

---@type LazySpec
return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "float",
    },
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      if not opts.mappings then opts.mappings = {} end
      local lazydocker = "lazydocker"
      if vim.fn.executable(lazydocker) == 1 then
        opts.mappings.n["<Leader>td"] = {
          function() core.toggle_term_cmd { cmd = lazydocker, direction = "float" } end,
          desc = "ToggleTerm lazydocker",
        }
      end
    end,
  },
}

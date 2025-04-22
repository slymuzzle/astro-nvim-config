---@type LazySpec
return {
  "giusgad/pets.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
  cmd = { "PetsNew", "PetsNewCustom" },
  cond = function() return not vim.g.neovide end,
  opts = {
    row = 7,
    popup = {
      width = "100%",
    },
  },
}

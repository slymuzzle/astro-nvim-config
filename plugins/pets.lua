return {
  "giusgad/pets.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
  ft = "alpha",
  cmd = { "PetsNew", "PetsNewCustom", "PetsList" },
  cond = function() return not vim.g.neovide end,
  opts = {
    row = 6,
    popup = {
      width = "100%",
    },
  },
}

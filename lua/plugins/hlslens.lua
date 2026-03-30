---@type LazySpec
return {
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufRead",
    opts = {},
  },
  {
    "AstroNvim/astrocore",
    opts = {
      on_keys = { auto_hlsearch = false },
    },
  },
}

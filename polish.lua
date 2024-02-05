local pets = require "user.utils.pets"

-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return function()
  -- Set autocommands
  vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Set nginx filtetype to docker nginx templates",
    pattern = "*.conf.template",
    command = "set filetype=nginx",
  })

  if not vim.g.neovide then
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function() pets.call_pets() end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaClosed",
      callback = function() pets.kill_pets() end,
    })
  end

  -- Set up custom filetypes
  -- vim.filetype.add {
  --   extension = {
  --     foo = "fooscript",
  --   },
  --   filename = {
  --     ["Foofile"] = "fooscript",
  --   },
  --   pattern = {
  --     ["~/%.config/foo/.*"] = "fooscript",
  --   },
  -- }
end

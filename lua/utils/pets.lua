local pets = require "pets"

local M = {}

M.my_pets = {
  {
    name = "O",
    type = "slime",
    style = "green",
  },
}

function M.call_pets()
  for _, pet in pairs(M.my_pets) do
    pets.create_pet(pet.name, pet.type, pet.style)
  end
end

function M.kill_pets()
  for _, pet in pairs(M.my_pets) do
    pets.kill_pet(pet.name)
  end
end

return M

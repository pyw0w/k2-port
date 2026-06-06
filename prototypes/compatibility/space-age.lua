-- SPDX-License-Identifier: LGPL-3.0-or-later
-- Copyright (C) 2026 PyW0W
if not mods["space-age"] then return end

-- Space Age recipe updates
local function update_recipes()
  -- Replace explosive-cannon-shell with tungsten-plate in explosive railgun shell
  local explosive_recipe = data.raw.recipe["k2-explosive-railgun-shell"]
  if explosive_recipe then
    for _, ingredient in pairs(explosive_recipe.ingredients) do
      if ingredient.name == "explosive-cannon-shell" then
        ingredient.name = "tungsten-plate"
        ingredient.amount = 2
      end
    end
  end

  -- Replace rocket-fuel with quantum-processor in antimatter railgun shell
  local antimatter_recipe = data.raw.recipe["k2-antimatter-railgun-shell"]
  if antimatter_recipe then
    for _, ingredient in pairs(antimatter_recipe.ingredients) do
      if ingredient.name == "rocket-fuel" then
        ingredient.name = "quantum-processor"
        ingredient.amount = 2
      end
    end
  end

  -- Replace battery with superconductor in impulse rifle ammo
  local impulse_recipe = data.raw.recipe["k2-impulse-rifle-ammo"]
  if impulse_recipe then
    for _, ingredient in pairs(impulse_recipe.ingredients) do
      if ingredient.name == "battery" then
        ingredient.name = "superconductor"
        ingredient.amount = 2
      end
    end
  end
end

update_recipes()

-- Update technology for Space Age
local tech = data.raw.technology["k2-advanced-tank"]
if tech then
  -- Add Space Age science packs
  --table.insert(tech.unit.ingredients, { "metallurgic-science-pack", 1 })
  --table.insert(tech.unit.ingredients, { "agri-science-pack", 1 })
  --table.insert(tech.unit.ingredients, { "electromagnetic-science-pack", 1 })

  -- Add planet prerequisites
  table.insert(tech.prerequisites, "planet-discovery-vulcanus")
  table.insert(tech.prerequisites, "planet-discovery-gleba")
  table.insert(tech.prerequisites, "planet-discovery-fulgora")
end

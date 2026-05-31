if not mods["space-age"] then return end

-- Space Age compatibility adjustments
-- Adjust recipe to use Space Age materials if available
local function update_recipe()
  local recipe = data.raw.recipe["k2-advanced-tank"]
  if not recipe then return end

  -- Replace processing-unit with more advanced components if available
  for _, ingredient in pairs(recipe.ingredients) do
    if ingredient.name == "processing-unit" then
      ingredient.name = "processing-unit"
      ingredient.amount = 20
    end
  end
end

update_recipe()

-- Update technology prerequisites for Space Age
local tech = data.raw.technology["k2-advanced-tank"]
if tech then
  -- Add Space Age specific prerequisites if they exist
  if data.raw.technology["space-platform-thruster"] then
    table.insert(tech.prerequisites, "space-platform-thruster")
  end
end
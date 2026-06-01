data:extend({
  {
    type = "technology",
    name = "k2-advanced-tank",
    icon = "__k2-port__/graphics/technologies/advanced-tank.png",
    icon_size = 256,
    prerequisites = { "tank", "advanced-circuit", "electric-engine" },
    unit = {
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "military-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 60,
    },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "k2-advanced-tank",
      },
      {
        type = "unlock-recipe",
        recipe = "k2-basic-railgun-shell",
      },
      {
        type = "unlock-recipe",
        recipe = "k2-explosive-railgun-shell",
      },
      {
        type = "unlock-recipe",
        recipe = "k2-antimatter-railgun-shell",
      },
      {
        type = "unlock-recipe",
        recipe = "k2-impulse-rifle-ammo",
      },
    },
  },
})
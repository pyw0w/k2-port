data:extend({
  {
    type = "projectile",
    name = "k2-basic-railgun-projectile",
    flags = { "not-on-map" },
    hidden = true,
    acceleration = 0.25,
    piercing_damage = 500,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "damage",
            damage = { amount = 250, type = "physical" },
          },
          {
            type = "create-entity",
            entity_name = "explosion",
          },
        },
      },
    },
    final_action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true,
          },
        },
      },
    },
    animation = {
      filename = "__k2-port__/graphics/projectiles/railbullet.png",
      frame_count = 1,
      width = 5,
      height = 90,
      priority = "high",
    },
    light = { intensity = 0.5, size = 10, color = { r = 0.8, g = 0.8, b = 0.5 } },
  },
})

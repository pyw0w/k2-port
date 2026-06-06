data:extend({
  {
    type = "projectile",
    name = "k2-explosion-railgun-projectile",
    flags = { "not-on-map" },
    hidden = true,
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    direction_only = true,
    acceleration = 0.25,
    piercing_damage = 500,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "damage",
            damage = { amount = 200, type = "physical" },
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
            entity_name = "big-explosion",
          },
          {
            type = "show-explosion-on-chart",
            scale = 0.5,
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true,
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 3,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "damage",
                    damage = { amount = 100, type = "k2-explosion" },
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion",
                  },
                },
              },
            },
          },
        },
      },
    },
    animation = {
      filename = "__k2-port__/graphics/projectiles/missile-e.png",
      frame_count = 1,
      width = 5,
      height = 90,
      priority = "high",
    },
    light = { intensity = 0.5, size = 10, color = { r = 1.0, g = 0.8, b = 0.5 } },
  },
})

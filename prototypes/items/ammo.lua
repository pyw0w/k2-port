-- SPDX-License-Identifier: LGPL-3.0-or-later
-- Adapted from Krastorio2: prototypes/items/ammo.lua (kr-railgun-shell, kr-impulse-rifle items)
-- Original: https://codeberg.org/raiguard/Krastorio2
data:extend({
  {
    type = "ammo",
    name = "k2-basic-railgun-shell",
    icon = "__k2-port__/graphics/icons/ammo/basic-railgun-shell.png",
    icon_size = 64,
    subgroup = "ammo",
    order = "d[cannon-shell]-d[basic-railgun-shell]",
    stack_size = 100,
    magazine_size = 1,
    ammo_category = "k2-railgun-shell",
    ammo_type = {
      target_type = "direction",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "k2-basic-railgun-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 100,
          source_effects = {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
      },
    },
  },
  {
    type = "ammo",
    name = "k2-explosive-railgun-shell",
    icon = "__k2-port__/graphics/icons/ammo/explosive-railgun-shell.png",
    icon_size = 64,
    subgroup = "ammo",
    order = "d[cannon-shell]-e[explosive-railgun-shell]",
    stack_size = 100,
    magazine_size = 1,
    ammo_category = "k2-railgun-shell",
    ammo_type = {
      target_type = "direction",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "k2-explosion-railgun-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 100,
          source_effects = {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
      },
    },
  },
  {
    type = "ammo",
    name = "k2-antimatter-railgun-shell",
    icon = "__k2-port__/graphics/icons/ammo/antimatter-railgun-shell.png",
    icon_size = 64,
    subgroup = "ammo",
    order = "d[cannon-shell]-f[antimatter-railgun-shell]",
    stack_size = 100,
    magazine_size = 1,
    ammo_category = "k2-railgun-shell",
    ammo_type = {
      target_type = "direction",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "k2-matter-railgun-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 100,
          source_effects = {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
      },
    },
    pictures = {
      layers = {
        {
          filename = "__k2-port__/graphics/icons/ammo/antimatter-railgun-shell.png",
          size = 64,
          scale = 0.5,
        },
        {
          filename = "__k2-port__/graphics/icons/ammo/antimatter-railgun-shell-light.png",
          size = 64,
          scale = 0.5,
          draw_as_light = true,
        },
      },
    },
  },
  {
    type = "ammo",
    name = "k2-impulse-rifle-ammo",
    icon = "__k2-port__/graphics/icons/ammo/impulse-rifle-ammo.png",
    icon_size = 64,
    subgroup = "ammo",
    order = "c[impulse-rifle-ammo]",
    stack_size = 200,
    magazine_size = 3,
    ammo_category = "k2-impulse-rifle",
    ammo_type = {
      target_type = "direction",
      clamp_position = true,
      action = {
        type = "line",
        range = 50,
        width = 2,
        range_effects = {
          type = "create-explosion",
          entity_name = "k2-impulse-rifle-beam",
        },
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "damage",
            damage = { amount = 120, type = "laser" },
          },
        },
      },
    },
    pictures = {
      layers = {
        {
          filename = "__k2-port__/graphics/icons/ammo/impulse-rifle-ammo.png",
          size = 64,
          scale = 0.5,
        },
        {
          filename = "__k2-port__/graphics/icons/ammo/impulse-rifle-ammo-light.png",
          size = 64,
          scale = 0.5,
          draw_as_light = true,
        },
      },
    },
  },
})

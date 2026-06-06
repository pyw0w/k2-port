-- SPDX-License-Identifier: LGPL-3.0-or-later
-- Gun stats adapted from Krastorio2: prototypes/vehicles/advanced-tank.lua
-- Original: https://codeberg.org/raiguard/Krastorio2
local movement_triggers = require("advanced-tank-movement-triggers")

-- Ammo categories defined in prototypes/categories/ammo.lua
-- Fuel category defined in prototypes/categories/fuel.lua
-- Equipment grid defined in prototypes/categories/equipment-grids.lua

data:extend({
  -- =========================================================================
  -- ENTITY
  -- =========================================================================
  {
    type = "car",
    name = "k2-advanced-tank",
    icon = "__k2-port__/graphics/icons/vehicles/advanced-tank.png",
    icon_size = 64,
    flags = { "placeable-neutral", "player-creation", "building-direction-8-way" },
    minable = { mining_time = 1, result = "k2-advanced-tank" },
    mined_sound = { filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8 },
    max_health = 5000,
    is_military_target = true,
    deliver_category = "vehicle",
    corpse = "k2-advanced-tank-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    immune_to_tree_impacts = true,
    immune_to_rock_impacts = true,
    energy_per_hit_point = 0.5,
    allow_remote_driving = true,
    trash_inventory_size = 20,
    resistances = {
      { type = "fire", percent = 80 },
      { type = "physical", percent = 60 },
      { type = "impact", percent = 80 },
      { type = "explosion", percent = 60 },
      { type = "acid", percent = 60 },
      { type = "laser", percent = 60 },
      { type = "electric", percent = 60 },
    },
    collision_box = { { -1.5, -1.8 }, { 1.5, 1.8 } },
    selection_box = { { -1.8, -2.2 }, { 1.8, 2.2 } },
    drawing_box = { { -3, -3.5 }, { 3, 3 } },
    effectivity = 0.8,
    braking_power = "2000kW",
    energy_source = {
      type = "burner",
      fuel_categories = { "k2-vehicle-fuel", "chemical" },
      effectivity = 1,
      fuel_inventory_size = 3,
      smoke = {
        {
          name = "tank-smoke",
          deviation = { 0.25, 0.25 },
          frequency = 50,
          position = { 0, 1.5 },
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
      },
    },
    consumption = "1500kW",
    terrain_friction_modifier = 0.2,
    friction = 0.002,
    light = {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture = {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          scale = 2,
          size = { 200, 200 },
        },
        shift = { 0, -14 },
        size = 2,
        intensity = 0.6,
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture = {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          scale = 2,
          size = { 200, 200 },
        },
        shift = { 0, 14 },
        size = 2,
        intensity = 0.6,
      },
    },
    animation = {
      layers = {
        {
          priority = "low",
          filename = "__k2-port__/graphics/buildings/advanced-tank-base.png",
          width = 416,
          height = 416,
          frame_count = 2,
          line_length = 16,
          direction_count = 64,
          shift = { 0, 0 },
          animation_speed = 8,
          max_advance = 0.2,
          scale = 0.5,
        },
        {
          priority = "low",
          filename = "__k2-port__/graphics/buildings/advanced-tank-base-shadow.png",
          width = 416,
          height = 416,
          frame_count = 2,
          line_length = 16,
          draw_as_shadow = true,
          direction_count = 64,
          shift = { 0, 0 },
          animation_speed = 8,
          max_advance = 0.2,
          scale = 0.5,
        },
        {
          priority = "low",
          filename = "__k2-port__/graphics/buildings/advanced-tank-base-mask.png",
          width = 416,
          height = 416,
          frame_count = 2,
          line_length = 16,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = { 0, 0 },
          animation_speed = 8,
          max_advance = 0.2,
          scale = 0.5,
        },
      },
    },
    turret_animation = {
      layers = {
        {
          filename = "__k2-port__/graphics/buildings/advanced-tank-turret.png",
          priority = "low",
          line_length = 8,
          width = 500,
          height = 500,
          direction_count = 64,
          shift = { 0, 0 },
          animation_speed = 8,
          scale = 0.5,
        },
        {
          filename = "__k2-port__/graphics/buildings/advanced-tank-turret-shadow.png",
          priority = "low",
          line_length = 8,
          width = 516,
          height = 516,
          draw_as_shadow = true,
          direction_count = 64,
          shift = { 0, 0 },
          animation_speed = 8,
          scale = 0.5,
        },
        {
          filename = "__k2-port__/graphics/buildings/advanced-tank-turret-mask.png",
          priority = "low",
          line_length = 8,
          width = 500,
          height = 500,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = { 0, 0 },
          animation_speed = 8,
          scale = 0.5,
        },
      },
    },
    turret_rotation_speed = 0.015,
    turret_return_timeout = 300,
    stop_trigger_speed = 0.2,
    stop_trigger = {
      {
        type = "play-sound",
        sound = {
          {
            filename = "__k2-port__/sounds/vehicles/advanced-tank-engine.ogg",
            volume = 0.3,
          },
        },
      },
    },
    sound_minimum_speed = 0.2,
    sound_scaling_ratio = 0.8,
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      sound = {
        filename = "__k2-port__/sounds/vehicles/advanced-tank-engine.ogg",
        volume = 0.37,
      },
      activate_sound = {
        filename = "__k2-port__/sounds/vehicles/advanced-tank-engine-start.ogg",
        volume = 0.7,
      },
      deactivate_sound = {
        filename = "__k2-port__/sounds/vehicles/advanced-tank-engine-start.ogg",
        volume = 0.4,
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume = 0.5 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.5 },
    rotation_speed = 0.005,
    tank_driving = true,
    weight = 5000,
    guns = {
      "k2-advanced-tank-machine-gun",
      "k2-advanced-tank-laser-cannon",
      "k2-advanced-tank-cannon-a",
      "k2-advanced-tank-cannon-b",
      "k2-advanced-tank-cannon-c",
    },
    equipment_grid = "k2-tank-grid-2",
    inventory_size = 60,
    track_particle_triggers = movement_triggers,
  },

  -- =========================================================================
  -- ITEM
  -- =========================================================================
  {
    type = "item",
    name = "k2-advanced-tank",
    icon = "__k2-port__/graphics/icons/vehicles/advanced-tank.png",
    icon_size = 64,
    subgroup = "transport",
    order = "b[personal-transport]-c[k2-advanced-tank]",
    place_result = "k2-advanced-tank",
    stack_size = 1,
    weight = 100000,
  },

  -- =========================================================================
  -- RECIPE
  -- =========================================================================
  {
    type = "recipe",
    name = "k2-advanced-tank",
    enabled = false,
    energy_required = 60,
    ingredients = {
      { type = "item", name = "tank", amount = 2 },
      { type = "item", name = "steel-plate", amount = 100 },
      { type = "item", name = "processing-unit", amount = 40 },
      { type = "item", name = "electric-engine-unit", amount = 30 },
      { type = "item", name = "advanced-circuit", amount = 60 },
      { type = "item", name = "iron-gear-wheel", amount = 50 },
    },
    results = { { type = "item", name = "k2-advanced-tank", amount = 1 } },
  },

  -- =========================================================================
  -- AMMO RECIPES
  -- =========================================================================
  {
    type = "recipe",
    name = "k2-basic-railgun-shell",
    enabled = false,
    energy_required = 4,
    ingredients = {
      { type = "item", name = "steel-plate", amount = 1 },
      { type = "item", name = "copper-plate", amount = 1 },
      { type = "item", name = "iron-plate", amount = 2 },
    },
    results = { { type = "item", name = "k2-basic-railgun-shell", amount = 1 } },
  },
  {
    type = "recipe",
    name = "k2-explosive-railgun-shell",
    enabled = false,
    energy_required = 6,
    ingredients = {
      { type = "item", name = "k2-basic-railgun-shell", amount = 1 },
      { type = "item", name = "explosive-cannon-shell", amount = 2 },
    },
    results = { { type = "item", name = "k2-explosive-railgun-shell", amount = 1 } },
  },
  {
    type = "recipe",
    name = "k2-antimatter-railgun-shell",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "k2-explosive-railgun-shell", amount = 1 },
      { type = "item", name = "processing-unit", amount = 5 },
      { type = "item", name = "rocket-fuel", amount = 10 },
    },
    results = { { type = "item", name = "k2-antimatter-railgun-shell", amount = 1 } },
  },
  {
    type = "recipe",
    name = "k2-impulse-rifle-ammo",
    enabled = false,
    energy_required = 3,
    ingredients = {
      { type = "item", name = "battery", amount = 2 },
      { type = "item", name = "advanced-circuit", amount = 1 },
      { type = "item", name = "copper-plate", amount = 1 },
    },
    results = { { type = "item", name = "k2-impulse-rifle-ammo", amount = 1 } },
  },

  -- =========================================================================
  -- GUNS
  -- =========================================================================
  -- Machine Gun
  {
    type = "gun",
    name = "k2-advanced-tank-machine-gun",
    localised_name = { "item-name.k2-advanced-tank-machine-gun" },
    icon = "__k2-port__/graphics/icons/guns/advanced-tank-machine-gun.png",
    icon_size = 64,
    hidden = true,
    auto_recycle = false,
    subgroup = "gun",
    order = "z[tank]-b[k2-machine-gun]",
    stack_size = 1,
    attack_parameters = {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 6,
      damage_modifier = 1.5,
      movement_slow_down_factor = 0.25,
      shell_particle = {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = { 0, 0 },
        creation_distance = -0.6875,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1,
      },
      projectile_center = { 0, -0.6 },
      projectile_creation_distance = 1.2,
      range = 30,
      sound = {
        {
          filename = "__k2-port__/sounds/weapons/advanced-tank-anti-material-rifle-1.ogg",
          volume = 0.6,
        },
        {
          filename = "__k2-port__/sounds/weapons/advanced-tank-anti-material-rifle-2.ogg",
          volume = 0.6,
        },
      },
    },
  },

  -- Laser Cannon
  {
    type = "gun",
    name = "k2-advanced-tank-laser-cannon",
    localised_name = { "item-name.k2-advanced-tank-laser-cannon" },
    icon = "__k2-port__/graphics/icons/guns/advanced-tank-laser-cannon.png",
    icon_size = 64,
    hidden = true,
    auto_recycle = false,
    subgroup = "gun",
    order = "z[tank]-c[k2-laser-cannon]",
    stack_size = 1,
    attack_parameters = {
      type = "projectile",
      ammo_category = "k2-impulse-rifle",
      cooldown = 30,
      damage_modifier = 1.5,
      movement_slow_down_factor = 0,
      projectile_center = { 0, -0.6 },
      projectile_creation_distance = 1.2,
      range = 60,
      sound = make_laser_sounds(),
    },
  },

  -- Cannon A (Railgun)
  {
    type = "gun",
    name = "k2-advanced-tank-cannon-a",
    localised_name = { "item-name.k2-advanced-tank-cannon-a" },
    icon = "__k2-port__/graphics/icons/guns/advanced-tank-cannon-a.png",
    icon_size = 64,
    hidden = true,
    auto_recycle = false,
    subgroup = "gun",
    order = "z[tank]-d[k2-cannon-a]",
    stack_size = 1,
    attack_parameters = {
      type = "projectile",
      ammo_category = "k2-railgun-shell",
      cooldown = 80,
      damage_modifier = 0.5,
      movement_slow_down_factor = 0.3,
      projectile_center = { 0, -0.6 },
      projectile_creation_distance = 1.2,
      min_range = 15,
      range = 60,
      sound = {
        {
          filename = "__k2-port__/sounds/weapons/railgun.ogg",
          volume = 0.8,
        },
      },
    },
  },

  -- Cannon B (Impulse Rifle)
  {
    type = "gun",
    name = "k2-advanced-tank-cannon-b",
    localised_name = { "item-name.k2-advanced-tank-cannon-b" },
    icon = "__k2-port__/graphics/icons/guns/advanced-tank-cannon-b.png",
    icon_size = 64,
    hidden = true,
    auto_recycle = false,
    subgroup = "gun",
    order = "z[tank]-e[k2-cannon-b]",
    stack_size = 1,
    attack_parameters = {
      type = "projectile",
      ammo_category = "k2-railgun-shell",
      cooldown = 80,
      damage_modifier = 0.5,
      movement_slow_down_factor = 0,
      projectile_center = { 0, -0.6 },
      projectile_creation_distance = 1.2,
      min_range = 15,
      range = 60,
      sound = {
        {
          filename = "__k2-port__/sounds/weapons/railgun.ogg",
          volume = 0.8,
        },
      },
    },
  },

  -- Cannon C (Auxiliary Cannon)
  {
    type = "gun",
    name = "k2-advanced-tank-cannon-c",
    localised_name = { "item-name.k2-advanced-tank-cannon-c" },
    icon = "__k2-port__/graphics/icons/guns/advanced-tank-cannon-c.png",
    icon_size = 64,
    hidden = true,
    auto_recycle = false,
    subgroup = "gun",
    order = "z[tank]-f[k2-cannon-c]",
    stack_size = 1,
    attack_parameters = {
      type = "projectile",
      ammo_category = "k2-railgun-shell",
      cooldown = 160,
      movement_slow_down_factor = 0,
      projectile_center = { 0, -0.6 },
      projectile_creation_distance = 1.2,
      min_range = 20,
      range = 120,
      sound = {
        {
          filename = "__k2-port__/sounds/weapons/railgun.ogg",
          volume = 0.8,
        },
      },
    },
  },
})
-- SPDX-License-Identifier: LGPL-3.0-or-later
-- Copyright (C) 2026 PyW0W
-- Compatibility patches that need to run in data-updates phase
require("prototypes.compatibility.space-age")

local function add_effect(tech_name, effect)
  local tech = data.raw.technology[tech_name]
  if tech then
    table.insert(tech.effects, effect)
  end
end

local railgun_damage = {
  { "physical-projectile-damage-1", 0.25 },
  { "physical-projectile-damage-2", 0.25 },
  { "physical-projectile-damage-3", 0.25 },
  { "physical-projectile-damage-4", 0.35 },
  { "physical-projectile-damage-5", 0.35 },
  { "physical-projectile-damage-6", 0.35 },
  { "physical-projectile-damage-7", 0.1 },
}

local railgun_speed = {
  { "weapon-shooting-speed-2", 0.2 },
  { "weapon-shooting-speed-3", 0.2 },
  { "weapon-shooting-speed-4", 0.2 },
  { "weapon-shooting-speed-5", 0.2 },
  { "weapon-shooting-speed-6", 0.2 },
}

local impulse_damage = {
  { "laser-weapons-damage-1", 0.25 },
  { "laser-weapons-damage-2", 0.25 },
  { "laser-weapons-damage-3", 0.25 },
  { "laser-weapons-damage-4", 0.35 },
  { "laser-weapons-damage-5", 0.35 },
  { "laser-weapons-damage-6", 0.35 },
  { "laser-weapons-damage-7", 0.1 },
}

local impulse_speed = {
  { "laser-shooting-speed-1", 0.2 },
  { "laser-shooting-speed-2", 0.2 },
  { "laser-shooting-speed-3", 0.15 },
  { "laser-shooting-speed-4", 0.15 },
  { "laser-shooting-speed-5", 0.1 },
  { "laser-shooting-speed-6", 0.1 },
  { "laser-shooting-speed-7", 0.1 },
}

for _, entry in ipairs(railgun_damage) do
  add_effect(entry[1], { type = "ammo-damage", ammo_category = "k2-railgun-shell", modifier = entry[2] })
end

for _, entry in ipairs(railgun_speed) do
  add_effect(entry[1], { type = "gun-speed", ammo_category = "k2-railgun-shell", modifier = entry[2] })
end

for _, entry in ipairs(impulse_damage) do
  add_effect(entry[1], { type = "ammo-damage", ammo_category = "k2-impulse-rifle", modifier = entry[2] })
end

for _, entry in ipairs(impulse_speed) do
  add_effect(entry[1], { type = "gun-speed", ammo_category = "k2-impulse-rifle", modifier = entry[2] })
end
-- SPDX-License-Identifier: LGPL-3.0-or-later
-- Adapted from Krastorio2: prototypes/explosions/impulse-rifle-beam.lua
-- Original: https://codeberg.org/raiguard/Krastorio2
data:extend({
  {
    type = "explosion",
    name = "k2-impulse-rifle-beam",
    flags = { "not-on-map" },
    hidden = true,
    subgroup = "explosions",
    rotate = true,
    beam = true,
    animations = {
      {
        filename = "__k2-port__/graphics/explosions/impulse-rifle-beam.png",
        priority = "extra-high",
        draw_as_glow = true,
        width = 62,
        height = 1,
        frame_count = 6,
        line_length = 6,
      },
    },
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
  },
})

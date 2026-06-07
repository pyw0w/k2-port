-- Final fixes phase
local multiplier = settings.startup["k2-railgun-damage-multiplier"].value

local projectiles = {
  "k2-basic-railgun-projectile",
  "k2-explosion-railgun-projectile",
  "k2-matter-railgun-projectile"
}

for _, name in pairs(projectiles) do
  local projectile = data.raw.projectile[name]
  if projectile and projectile.action then
    -- Проходим по действиям и умножаем урон
    if projectile.action.action_delivery and projectile.action.action_delivery.target_effects then
      for _, effect in pairs(projectile.action.action_delivery.target_effects) do
        if effect.type == "damage" and effect.damage then
          effect.damage.amount = math.floor(effect.damage.amount * multiplier)
        end
      end
    end
    -- Также проверяем nested-result (для взрывного и антиматерии)
    if projectile.final_action and projectile.final_action.action_delivery and projectile.final_action.action_delivery.target_effects then
      for _, effect in pairs(projectile.final_action.action_delivery.target_effects) do
        if effect.type == "nested-result" and effect.action and effect.action.action_delivery and effect.action.action_delivery.target_effects then
          for _, nested_effect in pairs(effect.action.action_delivery.target_effects) do
            if nested_effect.type == "damage" and nested_effect.damage then
              nested_effect.damage.amount = math.floor(nested_effect.damage.amount * multiplier)
            end
          end
        end
      end
    end
  end
end
local fluid_sprite_list = {
  'water'
}

local function has_value (tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function layer_fluid_icon( fluid )
  -- body
  if fluid.icon then
    fluid.icons = {
      {icon = fluid.icon},
      {icon = "__verbosity__/graphics/icons/fluid/" .. fluid.name .. ".png"}
      }
    fluid.icon = nil
  elseif fluid.icons then
    fluid.icons[#fluid.icons + 1] = {icon = "__verbosity__/graphics/icons/fluid/" .. fluid.name .. ".png"}
  end
end

for _, fluid in pairs(data.raw["fluid"]) do
  if has_value(fluid_sprite_list, fluid.name) then
    layer_fluid_icon(fluid)
  end
end

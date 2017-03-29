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

local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

for _, fluid in pairs(data.raw["fluid"]) do
  if file_exists("__verbosity__/graphics/icons/fluid/" .. fluid.name .. ".png") then
    layer_fluid_icon(fluid)
  end
end

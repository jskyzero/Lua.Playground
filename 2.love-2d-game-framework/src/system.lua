system = {}

local x, y, w, h = 20, 20, 60, 20


function system.initial()
  local major, minor, revision, codename = love.getVersion()
  local str = string.format("Version %d.%d.%d - %s", major, minor, revision, codename)
  print(str)
end

function system.update(dt)
  w = w + 1
  h = h + 1
end

function system.render()
  love.graphics.setColor(0, 0.4, 0.4)
  love.graphics.rectangle("fill", x, y, w, h)
  
end

return system
require("core.gameObject.gameObject")
require("core.gameObject.component")

local background = GameObject("background", 0, 0, 0)
local rect = Component()



function rect:initial(GObj)
  self.x, self.y, self.w, self.h = 0, 0, 0, 0

  local width =  love.graphics.getWidth()
  local height =  love.graphics.getHeight()
  self.w = width
  self.h = height

  self.time = 0
  self.color = {0, 0}
end

function rect:update(GObj)
  self.time = (self.time + 0.005) % (2 * math.pi)
  self.color[1] = (math.sin(self.time) + 1) / 2
  self.color[2] = (math.sin(self.time) + 1) / 2
end

function rect:render(GObj)
  love.graphics.setColor(0, self.color[1], self.color[2])
  love.graphics.rectangle("fill", GObj.x + self.x, GObj.y + self.y, self.w, self.h)
end

background:addComponent(rect)


return background
require("core.gameObject.gameObject")
require("core.gameObject.component")

local playground_0 = GameObject("playground_0", 0, 0, 0)

local rect = Component()

function rect:initial()
  self.x, self.y, self.w, self.h = 20, 20, 60, 20
end
function rect:update()
  self.w = self.w + 1
  self.h = self.h + 1
end
function rect:render()
  love.graphics.setColor(0, 0.4, 0.4)
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

playground_0:addComponent(rect)

return playground_0
require("core.gameObject.component")

local rect = Component()

function rect:initial(GObj)
  self.x, self.y, self.w, self.h = 20, 20, 60, 20
end

function rect:update(GObj)
  -- self.w = self.w + 1
  -- self.h = self.h + 1
end

function rect:render(GObj)
  love.graphics.setColor(0, 0.4, 0.4)
  love.graphics.rectangle("fill", GObj.x + self.x, GObj.y + self.y, self.w, self.h)
end

return rect
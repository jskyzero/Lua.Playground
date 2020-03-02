require("core.gameObject.gameObject")

local player = GameObject("player", 0, 0, 0)


local rect = Component()
player:addComponent(rect)


function rect:initial(GObj)
  self.x, self.y, self.w, self.h = 50, 50, 50, 50
end

function rect:update(GObj)
  if love.keyboard.isDown('w') then
    GObj.y = (GObj.y - 2) % love.graphics.getHeight()
  end
  if love.keyboard.isDown('a') then
    GObj.x = (GObj.x - 2) % love.graphics.getWidth()
  end
  if love.keyboard.isDown('s') then
    GObj.y = (GObj.y + 2) % love.graphics.getHeight()
  end
  if love.keyboard.isDown('d') then
    GObj.x = (GObj.x + 2) % love.graphics.getWidth()
  end
end

function rect:render(GObj)
  love.graphics.setColor(1, 5, 5)
  love.graphics.rectangle("fill", GObj.x, GObj.y , self.w, self.h)
end

return player
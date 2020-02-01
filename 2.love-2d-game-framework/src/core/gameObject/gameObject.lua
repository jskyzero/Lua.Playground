-- GameObject

GameObject = {
  x = 0;
  y = 0;
  z = 0;

  name = "GameObject";
  isActive = true;
  children = {};
  components = {};
}

GameObject.__index = GameObject

setmetatable(GameObject, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function GameObject:_init()
end

function GameObject:_init(name, x, y, z)
  self.name = name
  self.x = x
  self.y = y
  self.z = z
end

function GameObject:addChild(child)
  self.children[#self.children] = child
end

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
  -- self.children[#self.children] = child
  self.children[child] = child
end

function GameObject:removeChild(child)
  -- for k,v in pairs(self.children) do
  --   if (v == child) then
  --     self.children[k] = nil
  --   end
  -- end
  self.children[child] = nil
end

function GameObject:addComponent(component)
  assert(type(component) == "table")
  assert(type(component.initial) == "function")
  assert(type(component.update) == "function")
  assert(type(component.render) == "function")

  self.components[component] = component
  -- print("add success")
end

function GameObject:removeComponent(component)
  self.components[component] = nil
end

function GameObject:initial()
  for k,v in next,self.components,nil do
    v:initial(self)
  end
  for k,v in next,self.children,nil do
    v:_initial()
  end
end

function GameObject:update(dt)
  -- print(1, dt)
  for k,v in next,self.components,nil do
    v:update(self)
  end
  for k,v in next,self.children,nil do
    v:update()
  end
  -- print(2, dt)
end

function GameObject:render()
  -- slow unuseable version
  -- for k, v in pairs(self.components) do
  for k,v in next,self.components,nil do
    v:render(self)
  end
  for k,v in next,self.children,nil do
    v:render()
  end
end
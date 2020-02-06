-- GameObject

Component = {
  initial = function(self, GObj) end;
  update = function(self, GObj) end;
  render = function(self, GObj) end;
}

Component.__index = Component

setmetatable(Component, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function Component:_init()
end
-- core.system
-- use to link love callbacks with core logic

system = {}

local x, y, w, h = 20, 20, 60, 20

-- main entry for link
function system.main()
  -- love use callbacks

  -- love.load to do one-time setup of your game
  function love.load()
    system.initial()
  end

  -- love.update which is used to manage your game's state frame-to-frame
  function love.update(dt)
    system.update(dt)
  end

  -- love.draw which is used to render the game state onto the screen.
  function love.draw()
    system.render()
  end

  function love.run()
    return system.run()
  end
end


system.run = require((...) .. "Run")


function system.initial()
  local major, minor, revision, codename = love.getVersion()
  local versionStr = string.format("Version %d.%d.%d - %s", major, minor, revision, codename)
  print(versionStr)

  require("core.gameObject.gameObject")
  local a = GameObject()
  local b = GameObject(1, 2, 3)
  a.x = 1
  a:addChild(b)
  print(a.x, b.x)
  print(a.children[0] == b)

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
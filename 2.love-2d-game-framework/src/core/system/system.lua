-- core.system
-- use to link love callbacks with core logic

local system = {}


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

function system.load(root)
  system.root = root
end

function system.initial()
  local major, minor, revision, codename = love.getVersion()
  local versionStr = string.format("Version %d.%d.%d - %s", major, minor, revision, codename)
  print(versionStr)

  system.root:initial()
end

function system.update(dt)
  system.root:update(dt)
end

function system.render()
  system.root:render()
end

return system
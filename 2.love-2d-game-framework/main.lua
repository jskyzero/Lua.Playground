-- main of lua game


-- Sets the filesystem paths that will be searched when require is called.
love.filesystem.setRequirePath("src/?.lua")

-- import module
local system = require("system")






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

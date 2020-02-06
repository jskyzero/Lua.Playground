-- for editor love warnning, useless
if love == nil then love = {} end

-- main of lua game
-- sets the filesystem paths that will be searched when require is called.
love.filesystem.setRequirePath("src/?.lua;src/?/?.lua;src/?/?/?.lua;")

-- import module
local system = require("core.system.system")
local scene = require("biz.playground.playground_0")


system.load(scene)

-- run main
system.main()
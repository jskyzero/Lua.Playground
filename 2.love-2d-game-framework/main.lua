-- main of lua game
-- sets the filesystem paths that will be searched when require is called.
love.filesystem.setRequirePath("src/?.lua;src/?/?.lua;src/?/?/?.lua;")

-- import module
local system = require("core.system.system")

-- run main
system.main()
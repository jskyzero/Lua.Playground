require("core.gameObject.gameObject")


local background = require("biz.playground.background")
local player = require("biz.playground.player")
local system = require("biz.playground.system")



local root = GameObject("root", 0, 0, 0)


root:addChild(system)
root:addChild(background)
root:addChild(player)

return root
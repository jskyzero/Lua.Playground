require("core.gameObject.gameObject")
local rect = require("biz.playground.rect")

local root = GameObject("root", 0, 0, 0)

root:addComponent(rect)

return root
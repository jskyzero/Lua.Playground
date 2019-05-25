-- basic grammer of lua

--[[
  jskyzero
  
  2018、10
]]

print("variable naming")
assert(nil == nil)
-- unused variable is default nil
assert(x == nil) 
-- set a string value to variable x
local x = "now it is not nil"
assert(not (x == nil))
-- set nil to x
x = nil
assert (x == nil)


print("data type")
assert(type(nil) == "nil")
assert(type(true or false) == "boolean")
assert(type(1 or 1.0) == "number")
assert(type("Hello World!") == "string")
assert(type(type) == "function")
assert(type({ _ = nil }) == "table")

print("  nil in table and compare")
local class = { Jake = "Jake",
                Tom = "Tom",
                "Unknown", };
-- travel and print
for k, v in pairs(class) do
--  print (k .. " - " .. v)
end
-- delete the variable in table
class.Jake = nil
class["Tom"] = nil
class[1] = nil
-- print again
assert(next(class) == nil)
assert(type(class.Jake) == type(nil) and 
      type(class.Jake) == "nil" and 
      type(nil) == "nil" and 
      type("-") == "string")

assert("  false is false and nil")
if false or nil then
  -- print("false or nil is true")
else
  -- pass
end

print("  integer and fload is both number")
assert(type(1) == "number" and
      type(1.0) == "number" and
      type(1e1) == "number" and
      true)

print("  text break line use [[]]")
local index_html = [[
<html>
</html>
]]

print("  string number auto conversion")
assert("+2" + "1e1" == 12)
assert(123 .. 456 == "123456")
assert(#(123 .. 456) == 6)

local str = "0123456"
assert(string.len(str) == 7)
assert(string.byte(str, 1) == 48)
assert(string.byte(str, 2) - string.byte(str, 1) == 1)

assert(string.sub(str, 1, 1) == "0")
assert(string.sub(str, 1, 2) == "01")
assert(string.sub(str, 1) == str)

print("  table add and erase element")
local table = {}
table[2] = 2
table[2] = nil

print("  function usage")
function print_table(table)
  for k, v in pairs(table) do
    print(k .. " : " .. v)
  end
end

print("variable")

local num_x = 1

function get_number()
  -- default is local
  local num_y = 1
  -- same to num_y = 1 if outsize has no num_y
  return num_x - num_y
end

assert(get_number() == 0)
-- set to a new value
num_x = 2
assert(get_number() == 1)


local table = {1, 2, 3}
table[1], table[2], table[3] = table[3], table[2]
-- now table[3] == nil 
table[3] = table[1]
assert(table[1] == 3)
assert(table[2] == 2)
assert(table[3] == 3)



print("3 kind loop")
-- while loop
while (true)
do
  break
end
-- for loop
-- 1, 2, 3 can be expression, and will be caluate before loop
for x = 1, 2, 3 do
  break
end
-- do until type loop
repeat
  break
until (true)


print("function")
-- ... in arguements
local function local_print(...)
  for i, v in ipairs({...}) do
    -- print(i .. " : " .. v)
  end
  return select("#", ...)
end

assert(3 == local_print(1, 2, 3))

-- # for table size
local table = {1, 2, 3, abd=1}
assert(#table == 3)

local function local_print_string(fmt, ...)
  return string.format(fmt, ...)
end

assert(local_print_string("%-4d", 1) == "1   ")

local function local_print_in_another_way(...)
  local size = select("#", ...)
  for i = 1, size do
    print(i .. " : " .. select(i, ...))
  end
end


-- Tips
-- difference aboud ipairs and pairs
-- ipairs could not return nil and will break 
--    when firt not integer key and first not nil value
-- for example
-- 
-- local table = {y = 2, 1, 2, 3, x=1}
-- for i, v in ipairs(table) do 
--   print(i .. ":" .. v)
-- end

print("operator")
assert(1 ~= 2)
assert(5+0^2*8 == 5+((0^1)*8))

print("string")
assert('1' == "1" and
       "1" == [[1]])
local str  = "value is 10"
assert(string.sub(str, string.find( str, "%d%d")) == "10")

print("array")
print("iterator")
print("table")
print("module and package")
print("metatable")
print("coroutine")
print("file I/O")
print("errer system")
print("debug")
print("garbege collection")
print("oop")
print("datebase")
print("reference")











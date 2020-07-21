#include <iostream>
#include <lua_helper.hpp>

int main() {
  std::cout << "** Test Lua embedding" << std::endl;
  luahelper::LuaHelper lua = luahelper::LuaHelper();
  std::cout << lua.getVersion() << std::endl;

  lua.loadFileAsFunction("lua/luascript.lua");
  lua.pushAndSetNumber("cppvar", 1.1);
  lua.call(0, LUA_MULTRET);

  double luavar = 1.0;
  lua.getNumber("luavar", luavar);
  std::cout << "luavar = " << luavar << std::endl;
  lua.clear();

  lua_getglobal(lua, "myluafunction");
  lua_pushnumber(lua, 5);
  lua.call(1, 1);
  std::cout << "The return value of the function was " << lua_tostring(lua, -1)
            << std::endl;

  lua_pushcfunction(lua, luahelper::l_cppfunction);
  lua_setglobal(lua, "cppfunction");

  lua_getglobal(lua, "myfunction");
  lua_pushnumber(lua, 5);
  lua.call(1, 1);
  std::cout << "The return value of the function was " << lua_tonumber(lua, -1)
            << std::endl;
  lua.clear();
}

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
  lua.clear();
  std::cout << "luavar = " << luavar << std::endl;
  lua.clear();

  lua_getglobal(lua.getState(), "myluafunction");
  lua_pushnumber(lua.getState(), 5);
  lua.call(1, 1);
  std::cout << "The return value of the function was "
            << lua_tostring(lua.getState(), -1) << std::endl;

  lua_pushcfunction(lua.getState(), luahelper::l_cppfunction);
  lua_setglobal(lua.getState(), "cppfunction");

  lua_getglobal(lua.getState(), "myfunction");
  lua_pushnumber(lua.getState(), 5);
  lua_pcall(lua.getState(), 1, 1, 0);
  std::cout << "The return value of the function was " << lua_tonumber(lua, -1)
       << std::endl;
    lua.clear();
}

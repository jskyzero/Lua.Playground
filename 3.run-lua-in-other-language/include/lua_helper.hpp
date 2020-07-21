#ifndef __LUA_HELPER__
#define __LUA_HELPER__

/*
 * ┌───────────────────────────────────────────────────────────────────────────┐
 * |                                                                           |
 * |                               Lua Helper                                  |
 * ╠═══════════════════════════════════════════════════════════════════════════╣
 * |                                                            jskyzero 2020  |
 * └───────────────────────────────────────────────────────────────────────────┘
 *
 *
 *
 */

#include <cstdio>     // for printf
#include <iostream>   // for cout
#include <stdexcept>  // for runtime_error
#include <utility>    // for declval

namespace luahelper {

#define USE_LOG 1
#ifdef USE_LOG
#define LOG(x) (std::cout << (x) << std::endl)
#else
#define LOG(x) (std::cout)
#endif

#define TEST_ERROR(x) \
  if ((x)) this->error()

extern "C" {
#include "lauxlib.h"
#include "lua.h"
#include "lualib.h"
}

static int l_cppfunction(lua_State *L) {
  double arg = luaL_checknumber(L, 1);
  lua_pushnumber(L, arg * 0.5);
  return 1;
}

class LuaHelper {
 private:
  lua_State *L;

 public:
  LuaHelper();
  ~LuaHelper();
  operator lua_State *();  // explicit only works explicit conversions
  auto getState() -> lua_State *const;  // decltype(std::declval<L>())

  void pop(int);
  void clear();
  void remove(int n);
  void call(int nargs, int nresults);

  void loadFileAsFunction(std::string filePath);

  void pushAndSetNumber(std::string name, lua_Number value);
  void getNumber(std::string name, lua_Number &value);

  void dumpstack() const;
  void error() const;

  std::string getVersion() const;
};

LuaHelper::LuaHelper() : L(luaL_newstate()) { luaL_openlibs(L); };

LuaHelper::~LuaHelper() { lua_close(L); }

// explicit
LuaHelper::operator lua_State *() { return this->L; };

// decltype(std::declval<L>())
auto LuaHelper::getState() -> lua_State *const { return L; }

void LuaHelper::pop(int n = 1) { lua_pop(L, n); };

void LuaHelper::clear() {
  int top = lua_gettop(L);
  this->pop(top);
}

void LuaHelper::remove(int n) { lua_remove(L, n); };

void LuaHelper::loadFileAsFunction(std::string filePath) {
  TEST_ERROR(luaL_loadfile(L, filePath.c_str()));
}

void LuaHelper::call(int nargs, int nresults) {
  TEST_ERROR(lua_pcall(L, nargs, nresults, 0));
}

void LuaHelper::pushAndSetNumber(std::string name, lua_Number value) {
  lua_pushnumber(L, value);
  lua_setglobal(L, "cppvar");
}

void LuaHelper::getNumber(std::string name, lua_Number &value) {
  lua_getglobal(L, "luavar");
  value = lua_tonumber(L, -1);
}

void LuaHelper::dumpstack() const {
  int top = lua_gettop(L);
  for (int i = 1; i <= top; i++) {
    printf("%d\t%s\t", i, luaL_typename(L, i));
    switch (lua_type(L, i)) {
      case LUA_TNUMBER:
        printf("%g\n", lua_tonumber(L, i));
        break;
      case LUA_TSTRING:
        printf("%s\n", lua_tostring(L, i));
        break;
      case LUA_TBOOLEAN:
        printf("%s\n", (lua_toboolean(L, i) ? "true" : "false"));
        break;
      case LUA_TNIL:
        printf("%s\n", "nil");
        break;
      default:
        printf("%p\n", lua_topointer(L, i));
        break;
    }
  }
}

void LuaHelper::error() const {
  // throw std::runtime_error(
  //     std::string("Something went wrong loading the chunk (syntax error?)")
  //     + lua_tostring(L, -1));
  LOG("Something went wrong loading the chunk (syntax error?)");
  LOG(lua_tostring(L, -1));
  lua_pop(L, 1);
}

std::string LuaHelper::getVersion() const {
  return "Lua Helper 0.0.1 by jskyzero";
}

}  // namespace luahelper

#endif
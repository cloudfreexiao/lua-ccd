#pragma once

#include <lua.hpp>
#include <ccddbl/ccddbl.h>
#include <ccddbl/config.h>
#include <ccddbl/quat.h>
#include <ccddbl/vec3.h>

struct lccddbl {
    lua_State* L;
    ccddbl_t *ccddbl;
};
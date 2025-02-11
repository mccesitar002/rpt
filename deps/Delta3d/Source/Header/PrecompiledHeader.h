#pragma once

//Exclude rarely-used stuff from Windows headers
#define WIN32_LEAN_AND_MEAN

//DirectX
#ifdef _D3D9
#pragma comment(lib, "dxerr.lib")
#pragma comment(lib, "d3d9.lib")
#ifdef _DEBUG
#pragma comment(lib, "d3dx9d.lib")
#else
#pragma comment(lib, "d3dx9.lib")
#endif
#pragma comment(lib, "dxguid.lib")
#pragma comment(lib, "d3dcompiler.lib")
#endif

#undef min
#undef max

#include "targetver.h"

//Windows:
#include <Windows.h>
#include <emmintrin.h>
#include <VersionHelpers.h>

//STD:
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <mutex>
#include <fstream>
#include <sstream>
#include <ctime>
#include <iomanip>
#include <memory>
#include <unordered_map>
#include <stack>
#include <map>
#include <array>
#include <typeinfo>
#include <any>
#include <tuple>
#include <queue>
#include <functional>

//Experimental C++17:
#include <filesystem>

//DirectX:
#ifdef _D3D9
#include <d3d9.h>
#include <d3dx9.h>
#include <d3dx9math.h>
#include <d3dcompiler.h>
#include <DxErr.h>
#endif

//PugiXML:
#include <pugixml.hpp>

#include "globals.h"

namespace filesystem = std::filesystem;
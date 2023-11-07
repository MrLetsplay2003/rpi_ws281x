set(CMAKE_SYSTEM_NAME Windows)

set(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc)
set(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++)

set(CMAKE_C_FLAGS -w)
set(CMAKE_CXX_FLAGS -w)

set(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32)
set(CMAKE_PREFIX_PATH /usr/x86_64-w64-mingw32)
set(ENV{PKG_CONFIG_PATH} "${CMAKE_PREFIX_PATH}/sys-root/mingw/lib/pkgconfig/")
link_directories(windows/lib/)
include_directories(windows/include/)
link_directories(dependencies/openvr/bin/win64)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)

set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

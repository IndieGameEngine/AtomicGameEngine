# This is a CMake toolchain file so we can using Mingw to build Windows32 binaries.
# http://vtk.org/Wiki/CMake_Cross_Compiling

# usage
# cmake -DCMAKE_TOOLCHAIN_FILE=./toolchain-mingw32.cmake ../

set( CMAKE_SYSTEM_NAME Windows )
set( CMAKE_SYSTEM_PROCESSOR $ENV{CMAKE_SYSTEM_PROCESSOR} )

#-----<configuration>-----------------------------------------------

# configure only the lines within this <configure> block, typically

set( TC_PATH /usr/bin )
set( CROSS_COMPILE ${CMAKE_SYSTEM_PROCESSOR}-w64-mingw32- )

# specify the cross compiler
set( CMAKE_C_COMPILER   ${TC_PATH}/${CROSS_COMPILE}gcc )
set( CMAKE_CXX_COMPILER ${TC_PATH}/${CROSS_COMPILE}g++ )
set( CMAKE_RC_COMPILER  ${TC_PATH}/${CROSS_COMPILE}windres )

# where is the target environment
set( CMAKE_FIND_ROOT_PATH /usr/${CMAKE_SYSTEM_PROCESSOR}-w64-mingw32 )

#-----</configuration>-----------------------------------------------

# search for programs in the build host directories
set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )

# for libraries and headers in the target directories
set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )

# for Atomic
set( WIN32 1 )
set( MINGW 1 )

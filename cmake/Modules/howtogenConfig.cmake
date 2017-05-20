INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_HOWTOGEN howtogen)

FIND_PATH(
    HOWTOGEN_INCLUDE_DIRS
    NAMES howtogen/api.h
    HINTS $ENV{HOWTOGEN_DIR}/include
        ${PC_HOWTOGEN_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    HOWTOGEN_LIBRARIES
    NAMES gnuradio-howtogen
    HINTS $ENV{HOWTOGEN_DIR}/lib
        ${PC_HOWTOGEN_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(HOWTOGEN DEFAULT_MSG HOWTOGEN_LIBRARIES HOWTOGEN_INCLUDE_DIRS)
MARK_AS_ADVANCED(HOWTOGEN_LIBRARIES HOWTOGEN_INCLUDE_DIRS)


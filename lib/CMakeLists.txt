# Copyright 2011,2012,2016 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.

########################################################################
# Setup library
########################################################################
include(GrPlatform) #define LIB_SUFFIX

include(GrMiscUtils)
GR_EXPAND_X_CC_H_IMPL(howtogen square_XX ss ii ff cc bb)

include_directories(${Boost_INCLUDE_DIR})
link_directories(${Boost_LIBRARY_DIRS})

list(APPEND howtogen_sources
	${generated_sources}
)

set(howtogen_sources "${howtogen_sources}" PARENT_SCOPE)
if(NOT howtogen_sources)
	MESSAGE(STATUS "No C++ sources... skipping lib/")
	return()
endif(NOT howtogen_sources)

add_library(gnuradio-howtogen SHARED ${howtogen_sources})
add_dependencies(gnuradio-howtogen howtogen_generated_includes howtogen_generated_swigs)
target_link_libraries(gnuradio-howtogen ${Boost_LIBRARIES} ${GNURADIO_ALL_LIBRARIES})
set_target_properties(gnuradio-howtogen PROPERTIES DEFINE_SYMBOL "gnuradio_howtogen_EXPORTS")

if(APPLE)
    set_target_properties(gnuradio-howtogen PROPERTIES
        INSTALL_NAME_DIR "${CMAKE_INSTALL_PREFIX}/lib"
    )
endif(APPLE)

########################################################################
# Install built library files
########################################################################
include(GrMiscUtils)
GR_LIBRARY_FOO(gnuradio-howtogen RUNTIME_COMPONENT "howtogen_runtime" DEVEL_COMPONENT "howtogen_devel")

########################################################################
# Build and register unit test
########################################################################
include(GrTest)

include_directories(${CPPUNIT_INCLUDE_DIRS})

list(APPEND test_howtogen_sources
    ${CMAKE_CURRENT_SOURCE_DIR}/test_howtogen.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/qa_howtogen.cc
)

add_executable(test-howtogen ${test_howtogen_sources})

target_link_libraries(
  test-howtogen
  ${GNURADIO_RUNTIME_LIBRARIES}
  ${Boost_LIBRARIES}
  ${CPPUNIT_LIBRARIES}
  gnuradio-howtogen
)

GR_ADD_TEST(test_howtogen test-howtogen)

########################################################################
# Print summary
########################################################################
message(STATUS "Using install prefix: ${CMAKE_INSTALL_PREFIX}")
message(STATUS "Building for version: ${VERSION} / ${LIBVER}")


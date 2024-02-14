file(GLOB_RECURSE EAGGR_SOURCES **.cpp)

add_library(eaggr SHARED ${EAGGR_SOURCES})

target_include_directories(
    eaggr PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
                 ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/include)

target_link_libraries(eaggr PUBLIC PROJ::proj GDAL::GDAL)

set(EAGGR_NAME eaggr)

file(GLOB_RECURSE EAGGR_SOURCES **.cpp)

add_library(${EAGGR_NAME} SHARED ${EAGGR_SOURCES})

target_include_directories(
    ${EAGGR_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
                             ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/include)

target_link_libraries(${EAGGR_NAME} PUBLIC PROJ::proj GDAL::GDAL)

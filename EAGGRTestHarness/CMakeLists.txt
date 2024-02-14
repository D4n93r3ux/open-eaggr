file(
    GLOB_RECURSE
    EAGGR_TEST_HARNESS_SOURCES
    **.cpp
    **.cc)

add_executable(eaggr_test_harness ${EAGGR_TEST_HARNESS_SOURCES})

set(TEST_DATA_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/TestData)
set(TEST_DATA_DESTINATION_DIR
    ${CMAKE_CURRENT_BINARY_DIR}/OpenEAGGR/EAGGRTestHarness)

file(COPY ${TEST_DATA_SOURCE_DIR} DESTINATION ${TEST_DATA_DESTINATION_DIR})

target_include_directories(
    eaggr_test_harness
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
           ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty
           ${CMAKE_SOURCE_DIR}/EAGGR
           ${CMAKE_SOURCE_DIR}/EAGGR/3rdParty/include)

target_link_libraries(eaggr_test_harness PUBLIC eaggr PROJ::proj)

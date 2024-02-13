find_package(PROJ CONFIG REQUIRED)
find_package(GDAL CONFIG REQUIRED)

set(EAGGR_SOURCES_API API/dggs_data_store.cpp API/eaggr_api.cpp
                      API/eaggr_api_funcs.cpp)

set(EAGGR_SOURCES_COORDINATE_CONVERSION
    Src/CoordinateConversion/CoordinateConverter.cpp)

set(EAGGR_SOURCES_IMPORT_EXPORT
    Src/ImportExport/AbstractShapeImporter.cpp
    Src/ImportExport/GeoJsonExporter.cpp
    Src/ImportExport/GeoJsonImporter.cpp
    Src/ImportExport/KmlExporter.cpp
    Src/ImportExport/WktExporter.cpp
    Src/ImportExport/WktImporter.cpp)

set(EAGGR_SOURCES_LAT_LONG
    Src/LatLong/LatLongShape.cpp Src/LatLong/Point.cpp
    Src/LatLong/SphericalAccuracyPoint.cpp Src/LatLong/Wgs84AccuracyPoint.cpp
    Src/LatLong/Wgs84Linestring.cpp Src/LatLong/Wgs84Polygon.cpp)

set(EAGGR_SOURCES_MODEL
    Src/Model/ICell/HierarchicalCell.cpp
    Src/Model/ICell/OffsetCell.cpp
    Src/Model/IGrid/IHierarchicalGrid/Aperture4TriangleGrid.cpp
    Src/Model/IGrid/IOffsetGrid/Aperture3HexagonGrid.cpp
    Src/Model/IGrid/CellPartition.cpp
    Src/Model/IGridIndexer/HierarchicalGridIndexer.cpp
    Src/Model/IGridIndexer/OffsetGridIndexer.cpp
    Src/Model/IPolyhedralGlobe/Icosahedron.cpp
    Src/Model/IProjection/Snyder.cpp
    Src/Model/CartesianPoint.cpp
    Src/Model/DGGS.cpp
    Src/Model/FaceCoordinate.cpp
    Src/Model/TriangularFace.cpp)

set(EAGGR_SOURCES_SPATIAL_ANALYSIS
    Src/SpatialAnalysis/GeometryAnalyser.cpp
    Src/SpatialAnalysis/LinestringAnalyser.cpp
    Src/SpatialAnalysis/PolygonAnalyser.cpp
    Src/SpatialAnalysis/SpatialAnalysis.cpp)

set(EAGGR_SOURCES_UTILITIES Src/Utilities/Maths.cpp
                            Src/Utilities/StringConversion.cpp)

set(EAGGR_SOURCES
    ${EAGGR_SOURCES_API}
    ${EAGGR_SOURCES_COORDINATE_CONVERSION}
    ${EAGGR_SOURCES_IMPORT_EXPORT}
    ${EAGGR_SOURCES_LAT_LONG}
    ${EAGGR_SOURCES_MODEL}
    ${EAGGR_SOURCES_SPATIAL_ANALYSIS}
    ${EAGGR_SOURCES_UTILITIES})

add_library(eaggr SHARED ${EAGGR_SOURCES})

include_directories(${CMAKE_CURRENT_SOURCE_DIR}
                    ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/include)

# target_include_directories( eaggr PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
# ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/include)

# target_compile_options(eaggr PUBLIC "-H")

target_link_libraries(
  eaggr
  PUBLIC
    PROJ::proj
    # ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/bin/darwin-arm64/libgdal.31.0.2.dylib
    GDAL::GDAL)

# platform/macos/productbuild.cmake
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")

install(
    FILES
        "${CMAKE_SOURCE_DIR}/io.osquery.agent.conf"
        "${CMAKE_SOURCE_DIR}/io.osquery.agent.plist"
    DESTINATION
        "/private/var/osquery"
    COMPONENT 
        vistar
)
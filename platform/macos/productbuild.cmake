# platform/macos/productbuild.cmake
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_COMMAND_PRODUCTBUILD "${CMAKE_SOURCE_DIR}/productbuild.sh")
set(CPACK_COMMAND_PKGBUILD "${CPACK_COMMAND_PRODUCTBUILD}")

install(
    FILES
        "${CMAKE_SOURCE_DIR}/io.osquery.agent.conf"
        "${CMAKE_SOURCE_DIR}/io.osquery.agent.plist"
    DESTINATION
        "/private/var/osquery"
    COMPONENT 
        vistar
)
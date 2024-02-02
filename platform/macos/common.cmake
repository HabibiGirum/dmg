# platform/macos/common.cmake
set(OSQUERY_PACKAGE_RELEASE "1.macos")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_SET_DESTDIR ON)

install(
    DIRECTORY
        "${OSQUERY_DATA_PATH}/opt/osquery/osquery.app"
    DESTINATION
        "/opt/osquery/lib"
    USE_SOURCE_PERMISSIONS
    COMPONENT
        vistar
)

install(
    FILES
        "${CMAKE_SOURCE_DIR}/script.sh"
    DESTINATION
        "/opt/osquery/lib"
    PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ GROUP_EXECUTE GROUP_READ WORLD_EXECUTE WORLD_READ
    COMPONENT
        vistar
)


execute_process(
    COMMAND "${CMAKE_COMMAND}" -E create_symlink "/opt/osquery/lib/osquery.app/Contents/MacOS/osqueryd" osqueryi
    WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)

execute_process(
    COMMAND "${CMAKE_COMMAND}" -E create_symlink "/opt/osquery/lib/script.sh" scripti
    WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)

execute_process(
    COMMAND "${CMAKE_COMMAND}" -E create_symlink "/opt/osquery/lib/osquery.app/Contents/Resources/osqueryctl" osqueryctl
    WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)

install(
  FILES
    "${CMAKE_CURRENT_BINARY_DIR}/osqueryi"
    "${CMAKE_CURRENT_BINARY_DIR}/osqueryctl"
    "${CMAKE_CURRENT_BINARY_DIR}/scripti"
  DESTINATION
    "/usr/local/bin/"
  COMPONENT
    vistar
)

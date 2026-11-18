target_link_libraries(BlackHoleBreak PRIVATE
    ole32
    shell32
    comdlg32
    uuid
    wininet
    winmm
    comctl32
    dwmapi
    user32
    gdi32
    msimg32
    d3d11
    d3dcompiler
    dxgi
    shlwapi
    advapi32
    powrprof
    iphlpapi
    windowscodecs
    propsys
    crypt32
)

if(DEFINED CATIME_OUTPUT_DIR)
    set(OUTPUT_DIR ${CATIME_OUTPUT_DIR})
else()
    set(OUTPUT_DIR ${CMAKE_BINARY_DIR})
endif()

set_target_properties(BlackHoleBreak PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
    OUTPUT_NAME "BlackHoleBreak"
)
add_custom_command(TARGET BlackHoleBreak POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E echo "Build completed successfully!"
    COMMAND ${CMAKE_COMMAND} -E echo "Output directory: ${CMAKE_BINARY_DIR}"
    COMMAND ${CMAKE_COMMAND} -E echo "Executable: $<TARGET_FILE:BlackHoleBreak>"
)

option(ENABLE_DEBUG "Enable debug mode" OFF)
if(ENABLE_DEBUG)
    target_compile_definitions(BlackHoleBreak PRIVATE DEBUG_MODE)
endif()

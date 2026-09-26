cmake_minimum_required(VERSION 3.16)
project(tls_cpp LANGUAGES CXX)

# --- Settings ---
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# --- Warnings ---
add_compile_options(-Wall -Wextra)

# --- Sources ---
file(GLOB_RECURSE TLS_SOURCES CONFIGURE_DEPENDS "${CMAKE_SOURCE_DIR}/src/*.cpp")

add_executable(tls_cpp ${TLS_SOURCES})

target_include_directories(tls_cpp PRIVATE
  ${CMAKE_SOURCE_DIR}/include
)

# --- External libs in lib/ (.so / .a files) ---
target_link_directories(tls_cpp PRIVATE ${CMAKE_SOURCE_DIR}/lib)

file(GLOB LIB_FILES "${CMAKE_SOURCE_DIR}/lib/*.so" "${CMAKE_SOURCE_DIR}/lib/*.a")
foreach(LIB_FILE ${LIB_FILES})
  target_link_libraries(tls_cpp PRIVATE ${LIB_FILE})
endforeach()

message(STATUS "tls_cpp sources: ${TLS_SOURCES}")
message(STATUS "tls_cpp lib files linked: ${LIB_FILES}")

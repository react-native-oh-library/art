
cmake_minimum_required(VERSION 3.13)
set(CMAKE_VERBOSE_MAKEFILE on)
set(rnoh_art_generated_dir "${CMAKE_CURRENT_SOURCE_DIR}/generated")

file(GLOB rnoh_art_SRC CONFIGURE_DEPENDS *.cpp)
file(GLOB_RECURSE rnoh_art_generated_SRC "${rnoh_art_generated_dir}/**/*.cpp")

add_library(rnoh_art SHARED ${rnoh_art_SRC} ${rnoh_art_generated_SRC})
target_include_directories(rnoh_art PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${rnoh_art_generated_dir}
    ${CMAKE_CURRENT_SOURCE_DIR}/generated/react/render/components/react_native_community_art
)

target_link_libraries(rnoh_art PUBLIC rnoh)
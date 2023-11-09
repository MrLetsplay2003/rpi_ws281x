#!/bin/sh

BASE_DIR="$(dirname "$0")"

COMMAND="${@:-true}"
echo "Extra command is: ${COMMAND}"

CMAKE_EXTRA="${CMAKE_EXTRA:-}"
echo "CMake extra is: ${CMAKE_EXTRA}"

BUILD_CMD="cd /out && rm -r /out/* && cmake -DCMAKE_TOOLCHAIN_FILE=/build/toolchains/armel.cmake -DBUILD_SHARED=ON -DBUILD_SUFFIX=armel ${CMAKE_EXTRA} /build && make clean all"
docker compose -f "${BASE_DIR}/toolchains/docker-compose.arm.yml" run --rm build_armel sh "-c" "${COMMAND} && ${BUILD_CMD}"
docker compose -f "${BASE_DIR}/toolchains/docker-compose.arm.yml" run --rm build_armhf sh "-c" "${COMMAND} && ${BUILD_CMD}"
docker compose -f "${BASE_DIR}/toolchains/docker-compose.arm.yml" run --rm build_aarch64 sh "-c" "${COMMAND} && ${BUILD_CMD}"

#!/bin/sh

BASE_DIR="$(dirname "$0")"

COMMAND="${@:-true}"
echo "Extra command is: ${COMMAND}"

CMAKE_EXTRA="${CMAKE_EXTRA:-}"
echo "CMake extra is: ${CMAKE_EXTRA}"

docker compose -f "${BASE_DIR}/toolchains/docker-compose.arm.yml" build --build-arg EXTRA_CMD="${COMMAND}"

export UID="$(id -u)"
export GID="$(id -g)"

mkdir "${BASE_DIR}/build.armel"
BUILD_CMD="cd /out && rm -rf /out/* && cmake -DCMAKE_TOOLCHAIN_FILE=/build/toolchains/armel.cmake -DBUILD_SHARED=ON -DBUILD_SUFFIX=armel ${CMAKE_EXTRA} /build && make clean all"
docker compose -f "${BASE_DIR}/toolchains/docker-compose.arm.yml" run --rm build_armel sh "-c" "${BUILD_CMD}"

mkdir "${BASE_DIR}/build.armhf"
BUILD_CMD="cd /out && rm -rf /out/* && cmake -DCMAKE_TOOLCHAIN_FILE=/build/toolchains/armhf.cmake -DBUILD_SHARED=ON -DBUILD_SUFFIX=armhf ${CMAKE_EXTRA} /build && make clean all"
docker compose -f "${BASE_DIR}/toolchains/docker-compose.arm.yml" run --rm build_armhf sh "-c" "${BUILD_CMD}"

mkdir "${BASE_DIR}/build.aarch64"
BUILD_CMD="cd /out && rm -rf /out/* && cmake -DCMAKE_TOOLCHAIN_FILE=/build/toolchains/aarch64.cmake -DBUILD_SHARED=ON -DBUILD_SUFFIX=aarch64 ${CMAKE_EXTRA} /build && make clean all"
docker compose -f "${BASE_DIR}/toolchains/docker-compose.arm.yml" run --rm build_aarch64 sh "-c" "${BUILD_CMD}"

mkdir "${BASE_DIR}/build.amd64"
BUILD_CMD="cd /out && rm -rf /out/* && cmake -DBUILD_SHARED=ON -DBUILD_SUFFIX=amd64 ${CMAKE_EXTRA} /build && make clean all"
docker compose -f "${BASE_DIR}/toolchains/docker-compose.arm.yml" run --rm build_amd64 sh "-c" "${BUILD_CMD}"

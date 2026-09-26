#!/usr/bin/env bash
# Configure and build the project. Binary lands in build/bin/tls_cpp.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="${ROOT_DIR}/build"
BUILD_TYPE="${1:-Release}"
JOBS="${JOBS:-$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)}"

mkdir -p "${BUILD_DIR}"
cmake -S "${ROOT_DIR}" -B "${BUILD_DIR}" -DCMAKE_BUILD_TYPE="${BUILD_TYPE}"
cmake --build "${BUILD_DIR}" -j "${JOBS}"

echo "Binary: ${BUILD_DIR}/bin/tls_cpp"

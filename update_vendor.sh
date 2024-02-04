#!/bin/bash

set -e -o pipefail

CMSIS_CORE_VERSION="v5.6.0_cm4"
CMSIS_DEVICE_G4_VERSION="v1.2.3"

REPODIR="$(mktemp -d)"
trap 'rm -rf "${REPODIR}"' EXIT

git clone \
    -c advice.detachedHead=false \
    --depth=1 \
    --branch="${CMSIS_CORE_VERSION}" \
    "https://github.com/STMicroelectronics/cmsis_core.git" \
    "${REPODIR}/cmsis_core"

git clone \
    -c advice.detachedHead=false \
    --depth=1 \
    --branch="${CMSIS_DEVICE_G4_VERSION}" \
    "https://github.com/STMicroelectronics/cmsis_device_g4.git" \
    "${REPODIR}/cmsis_device_g4"

rm -rf ./vendor/
mkdir -p ./vendor/{cmsis_core/include,cmsis_device_g4/{src,include}}

cp \
    --verbose \
    "${REPODIR}"/cmsis_core/LICENSE.txt \
    ./vendor/LICENSE

cp \
    --verbose \
    "${REPODIR}"/cmsis_core/Core/Include/cmsis_compiler.h \
    "${REPODIR}"/cmsis_core/Core/Include/cmsis_gcc.h \
    "${REPODIR}"/cmsis_core/Core/Include/cmsis_version.h \
    "${REPODIR}"/cmsis_core/Core/Include/core_cm4.h \
    "${REPODIR}"/cmsis_core/Core/Include/mpu_armv7.h \
    ./vendor/cmsis_core/include/

cp \
    --verbose \
    "${REPODIR}"/cmsis_device_g4/Include/stm32g4*.h \
    "${REPODIR}"/cmsis_device_g4/Include/system_stm32g4xx.h \
    ./vendor/cmsis_device_g4/include/

cp \
    --verbose \
    "${REPODIR}"/cmsis_device_g4/Source/Templates/gcc/startup_stm32g4*.s \
    "${REPODIR}"/cmsis_device_g4/Source/Templates/system_stm32g4xx.c \
    ./vendor/cmsis_device_g4/src/

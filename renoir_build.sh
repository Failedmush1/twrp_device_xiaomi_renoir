#!/bin/bash

# OrangeFox Recovery Build Script
# Target: Xiaomi Mi 11 Lite 5G (renoir)

# --- Configuration ---
DEVICE="renoir"
LUNCH_COMBO="twrp_${DEVICE}-eng"
MAKE_CLEAN=false
BUILD_TARGETS="adbd bootimage"

# --- Build Variables ---
export ALLOW_MISSING_DEPENDENCIES=true
export OF_MAINTAINER="Failedmush"
export FOX_VARIANT="Beta"
export FOX_BUILD_TYPE="Unofficial"
export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk-v28.1.zip
# export FOX_MAINTAINER_PATCH_VERSION="01" # Optional suffix (e.g. R12.0_01)

# Optional: Add any other vars from your vendorsetup here
export FOX_ENABLE_APP_MANAGER=1
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1

# --- Logic ---

echo "--- Initializing OrangeFox Build for $DEVICE ---"

# Source environment
if [ -f build/envsetup.sh ]; then
    source build/envsetup.sh
else
    echo "Error: build/envsetup.sh not found!"
    exit 1
fi

# Lunch
echo "--- Lunching $LUNCH_COMBO ---"
lunch $LUNCH_COMBO || { echo "Lunch failed!"; exit 1; }

# Clean (if enabled)
if [ "$MAKE_CLEAN" = true ]; then
    echo "--- Cleaning build directory ---"
    make clean
fi

# Build
echo "--- Starting compilation: $BUILD_TARGETS ---"
start_time=$(date +%s)

mka $BUILD_TARGETS

res=$?
end_time=$(date +%s)
duration=$((end_time - start_time))

if [ $res -eq 0 ]; then
    echo "--- Build Completed Successfully in $((duration / 60))m $((duration % 60))s ---"
    echo "Output should be in: out/target/product/$DEVICE/"
else
    echo "--- Build Failed! ---"
    exit 1
fi

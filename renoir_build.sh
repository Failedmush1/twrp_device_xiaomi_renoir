#!/bin/bash

# Exit on error
set -e

# Just to be on safer side
export OUT_DIR=out
ulimit -n 16000

# Get the root directory of the TWRP source tree
# (Assumes this script is in device/xiaomi/renoir/)
ROOT_DIR=$(realpath "$(dirname "$0")/../../..")
cd "$ROOT_DIR"

# Build Environment Variables
export TW_INCLUDE_RECOVERY_INSTALLER=true
export TARGET_RECOVERY_DEVICE_MODULES="recovery_installer"
export ALLOW_MISSING_DEPENDENCIES=true

# Check for recovery installer template and clone if missing
if [ ! -d "bootable/recovery/installer" ]; then
    echo "Cloning TWRP A/B installer template..."
    git clone https://github.com/osm0sis/twrp_abtemplate bootable/recovery/installer
fi

# Initialize environment
source build/envsetup.sh
unset TARGET_PRODUCT
unset TARGET_BUILD_VARIANT

# Apply TWRP recovery installer patch (5445)
echo "Applying TWRP recovery installer patch (5445)..."
# repopick -g https://gerrit.twrp.me 5445 || echo "Patch already applied or failed to apply."

# Apply vold patches
# (rest of patches logic)
echo "Applying vold patches..."
VOLD_PATCH_DIR="$ROOT_DIR/device/xiaomi/renoir/patches"
cd "$ROOT_DIR/system/vold"
for patch in "$VOLD_PATCH_DIR"/*.patch; do
    if [ -f "$patch" ]; then
        echo "Applying $(basename "$patch")..."
        git apply "$patch" || echo "Patch $(basename "$patch") already applied or failed."
    fi
done
cd "$ROOT_DIR"

# Lunch and Build
lunch twrp_renoir-eng
# make clean
mka adbd bootimage

echo "Build completed! Outputs are in out/target/product/renoir/"
cd out/target/product/renoir/
if [ -f "boot.img" ]; then
    mv boot.img twrp-3.7.1_12-unofficial-renoir.img
fi
if [ -f "recovery-installer.zip" ]; then
    mv recovery-installer.zip twrp-3.7.1_12-unofficial-renoir.zip
fi
ls -lh twrp-3.7.1_12-unofficial-renoir.img twrp-3.7.1_12-unofficial-renoir.zip

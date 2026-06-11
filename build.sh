#!/bin/bash

# Exit on error
set -e

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

# Apply TWRP recovery installer patch (5445)
echo "Applying TWRP recovery installer patch (5445)..."
repopick -g https://gerrit.twrp.me 5445 || echo "Patch already applied or failed to apply."

# Lunch and Build
lunch twrp_renoir-eng
make clean
mka adbd bootimage

echo "Build completed! Outputs are in out/target/product/renoir/"
ls -lh out/target/product/renoir/boot.img out/target/product/renoir/recovery-installer.zip

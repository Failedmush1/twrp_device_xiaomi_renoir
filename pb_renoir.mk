#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Inherit from fog device
$(call inherit-product, device/xiaomi/renoir/device.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/pb/config/common.mk)

# Product Specifics
PRODUCT_DEVICE := renoir
PRODUCT_NAME := pb_renoir
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi 11 lite 5G
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

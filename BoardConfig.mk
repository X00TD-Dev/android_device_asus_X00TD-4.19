#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdm660-common
include device/asus/sdm660-common/BoardConfigCommon.mk

DEVICE_PATH := device/asus/X00TD
KERNEL_PATH := device/asus/X00TD-kernel

# Assert
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := ASUS_X00TD,X00TD,X00T

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm636

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_NO_KERNEL_OVERRIDE := true
LOCAL_KERNEL := $(KERNEL_PATH)/Image.gz-dtb
PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel

# Workaround to make lineage's soong generator work
TARGET_KERNEL_SOURCE := kernel/asus/sdm660

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/tpd_gesture"

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Inherit the proprietary files
include vendor/asus/X00TD/BoardConfigVendor.mk

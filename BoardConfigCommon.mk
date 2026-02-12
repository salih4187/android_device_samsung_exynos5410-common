#
# Copyright (C) 2013 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

COMMON_PATH := device/samsung/exynos5410-common

BOARD_VENDOR := samsung

BUILD_BROKEN_DUP_RULES := true

# Include path
TARGET_SPECIFIC_HEADER_PATH += $(COMMON_PATH)/include

# Binder
TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := universal5410
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := exynos5
TARGET_SLSI_VARIANT := cm

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a15

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_PAGESIZE := 2048
LZMA_RAMDISK_TARGETS := recovery
TARGET_LINUX_KERNEL_VERSION := 3.4
TARGET_KERNEL_SOURCE := kernel/samsung/exynos5410

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Bluetooth
BOARD_CUSTOM_BT_CONFIG := $(COMMON_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BCM_BLUETOOTH_MANTA_BUG := true

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_HALF_RES := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
RED_LED_PATH := "/sys/class/leds/led_r/brightness"
GREEN_LED_PATH := "/sys/class/leds/led_g/brightness"
BLUE_LED_PATH := "/sys/class/leds/led_b/brightness"
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"
CHARGING_ENABLED_PATH := "/sys/class/power_supply/battery/batt_lp_charging"

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= false
    WITH_DEXPREOPT := true
  endif
endif

# Display
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000U

# Filesystem
BOARD_ROOT_EXTRA_FOLDERS := efs
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

# Filesystems
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 2172649472
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15485760
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2898264064
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
# 9604956160 <real size> - 16384 <encryption footer>
BOARD_USERDATAIMAGE_PARTITION_SIZE := 9604939776
TARGET_USERIMAGES_USE_EXT4 := true

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true

# Graphics
BOARD_USE_BGRA_8888_FB := true
BOARD_USE_SAMSUNG_CAMERAFORMAT_NV21 := true

# IR
IR_HAL_SUFFIX := universal5410

# HIDL
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml

# Legacy BLOB Support
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/hw/rild=27 \
    /system/vendor/bin/hw/android.hardware.sensors@1.0-service.exynos5410=22

# Lineage Hardware
BOARD_HARDWARE_CLASS := hardware/samsung/lineagehw
BOARD_HARDWARE_CLASS += device/samsung/exynos5410-common/lineagehw

# Netd
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# Recovery
TARGET_RECOVERY_DENSITY := xhdpi

# Unified PowerHAL
TARGET_POWERHAL_VARIANT := samsung

# Samsung  OpenMAX Video
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_CSC_HW := false
BOARD_USE_DMA_BUF := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_H264_PREPEND_SPS_PPS := false
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_S3D_SUPPORT := false
BOARD_USE_STOREMETADATA := true
BOARD_USE_QOS_CTRL := false
BOARD_USES_NEON_BLITANTIH := true

# Seccomp filters
BOARD_SECCOMP_POLICY := device/samsung/exynos5410-common/seccomp

# SELinux
#BOARD_SEPOLICY_DIRS += \
    device/samsung/exynos5410-common/sepolicy

SELINUX_IGNORE_NEVERALLOWS := true

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/lib/libsec-ril.so|/vendor/lib/libshim_atomic.so \
    /vendor/lib/libsensorhub.so|/vendor/lib/libshim_binder.so \
    /vendor/lib/libexynoscamera.so|/vendor/lib/libshim_camera.so \
    /vendor/lib/egl/libGLESv2_POWERVR_SGX544_115.so|/vendor/lib/libshim_gpu.so

# Wifi
BOARD_HAVE_SAMSUNG_WIFI          := true
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_BAND                        := 802_11_ABG

# inherit from the proprietary version
-include vendor/samsung/exynos5410-common/BoardConfigVendor.mk

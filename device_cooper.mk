# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/samsung/cooper/overlay

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    libOmxCore \
    libOmxVidEnc \
    make_ext4fs \
    brcm_patchram_plus \
    sec_touchscreen.kcm \
    copybit.cooper \
    lights.cooper \
    gralloc.cooper \
    gps.cooper \
    setup_fs \
    CMTimers \
    Torch \
    FM \
    CMDroidwall \
    SamsungServiceMode \
    rzscontrol \
    bdaddr_read \
    dump_image \
    e2fsck \
    setup_fs \
    toggleshutter \
    patchlcs \
    erase_image \
    flash_image \
    screencap \
    dexpreopt \
    CMParts \
    CMWallpapers

# proprietary side of the device
$(call inherit-product-if-exists, vendor/samsung/cooper/cooper-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/abtfilt:system/bin/abtfilt \
    device/samsung/cooper/prebuilt/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/cooper/prebuilt/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
    device/samsung/cooper/prebuilt/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/cooper/prebuilt/sec_key.kl:system/usr/keylayout/sec_key.kl

# fstab
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/samsung/cooper/init.gt-s5830.rc:root/init.gt-s5830.rc \
    device/samsung/cooper/ueventd.gt-s5830.rc:root/ueventd.gt-s5830.rc

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/cooper/prebuilt/audio_effects.conf:system/etc/audio_effects.conf \
    device/samsung/cooper/prebuilt/poweron.ogg:system/media/poweron.ogg \
    device/samsung/cooper/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/cooper/prebuilt/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/cooper/prebuilt/get_macaddrs:system/bin/get_macaddrs \
    device/samsung/cooper/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf

# Hardware
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/cooper/prebuilt/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/cooper/prebuilt/modules/sec_param.ko:root/lib/modules/sec_param.ko

## Tweaks
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/70zipalign:system/etc/init.d/70zipalign \
    device/samsung/cooper/prebuilt/zipalign:system/bin/zipalign \
    device/samsung/cooper/prebuilt/be_photo:system/etc/be_photo \
    device/samsung/cooper/prebuilt/be_movie:system/etc/be_movie

## wifi
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/wifi/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/cooper/prebuilt/ath6k/AR6003/hw2.0/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    device/samsung/cooper/prebuilt/ath6k/AR6003/hw2.0/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    device/samsung/cooper/prebuilt/ath6k/AR6003/hw2.0/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    device/samsung/cooper/prebuilt/ath6k/AR6003/hw2.0/bdata.SD31.bin.01:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.01 \
    device/samsung/cooper/prebuilt/ath6k/AR6003/hw2.0/bdata.SD31.bin.02:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.02 \
    device/samsung/cooper/prebuilt/ath6k/AR6003/hw2.0/bdata.SD31.bin.03:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.03 \
    device/samsung/cooper/prebuilt/ath6k/AR6003/hw2.0/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    device/samsung/cooper/prebuilt/ath6k/AR6003/hw2.0/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \

## application
PRODUCT_COPY_FILES += \
    device/samsung/cooper/app/BMKG.apk:system/app/BMKG.apk

#Media profile
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/cooper/cooper-vendor-blobs.mk)

PRODUCT_NAME := cooper
PRODUCT_DEVICE := cooper
PRODUCT_MODEL := GT-S5830
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung

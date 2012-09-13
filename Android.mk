LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),cooper)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := sec_touchscreen.kcm
LOCAL_MODULE_TAGS := optional
include $(BUILD_KEY_CHAR_MAP)

include $(call all-makefiles-under,$(LOCAL_PATH))
endif

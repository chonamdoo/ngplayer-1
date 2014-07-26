LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := ffmpeg-prebuilt
LOCAL_SRC_FILES := ffmpeg-build/$(TARGET_ARCH_ABI)/libffmpeg.so
LOCAL_EXPORT_C_INCLUDES := ffmpeg-build/$(TARGET_ARCH_ABI)/include
LOCAL_EXPORT_LDLIBS := $(LOCAL_PATH)/ffmpeg-build/$(TARGET_ARCH_ABI)/libffmpeg.so
LOCAL_PRELINK_MODULE := true
include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_ALLOW_UNDEFINED_SYMBOLS=false
LOCAL_C_INCLUDES += $(LOCAL_PATH)/yuv2rgb/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ffmpeg-build/$(TARGET_ARCH_ABI)/include

LOCAL_MODULE    := media_api
LOCAL_CFLAGS := -D__ARM_NEON__ -mfpu=neon
LOCAL_SRC_FILES := media_api.c yuv2rgb/src/yuv2rgb.neon.S
LOCAL_LDLIBS := -llog -lz -ljnigraphics -lm 
LOCAL_SHARED_LIBRARIES := ffmpeg-prebuilt

include $(BUILD_SHARED_LIBRARY)
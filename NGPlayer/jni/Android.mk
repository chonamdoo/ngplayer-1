LOCAL_PATH := $(call my-dir)

#include $(CLEAR_VARS)
#LOCAL_MODULE:= libavcodec
#LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg/output/lib/libavcodec.a
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/output/include
#include $(PREBUILT_STATIC_LIBRARY)
# 
#include $(CLEAR_VARS)
#LOCAL_MODULE:= libavformat
#LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg/output/lib/libavformat.a
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/output/include
#include $(PREBUILT_STATIC_LIBRARY)
# 
#include $(CLEAR_VARS)
#LOCAL_MODULE:= libswscale
#LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg/output/lib/libswscale.a
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/output/include
#include $(PREBUILT_STATIC_LIBRARY)
# 
#include $(CLEAR_VARS)
#LOCAL_MODULE:= libavutil
#LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg/output/lib/libavutil.a
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/output/include
#include $(PREBUILT_STATIC_LIBRARY)
# 
#include $(CLEAR_VARS)
#LOCAL_MODULE:= libavfilter
#LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg/output/lib/libavfilter.a
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/output/include
#include $(PREBUILT_STATIC_LIBRARY)
# 
#include $(CLEAR_VARS)
#LOCAL_MODULE:= libswresample
#LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg/output/lib/libswresample.a
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/output/include
#include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := libffmpeg_android
LOCAL_SRC_FILES := com_ndh_ngplayer_NativeCall.c
#LOCAL_C_INCLUDES := $(LOCAL_PATH)
#LOCAL_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/libavcodec \
#					$(LOCAL_PATH)/ffmpeg/libavfilter \
#					$(LOCAL_PATH)/ffmpeg/libavformat \
#					$(LOCAL_PATH)/ffmpeg/libavutil \
#					$(LOCAL_PATH)/ffmpeg/libswscale
LOCAL_LDLIBS := -llog
#LOCAL_STATIC_LIBRARIES := libavformat libavcodec libswscale libavutil libswresample
#LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
include $(BUILD_SHARED_LIBRARY)





#-------------------------------------------------------------------------------------
#
## so파일 빌드하기
#LOCAL_PATH := $(call my-dir)
#
#include $(CLEAR_VARS)
#LOCAL_MODULE:= libavcodec
#LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg/output/lib/libavcodec.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/output/include
#include $(PREBUILT_SHARED_LIBRARY)
# 
#include $(CLEAR_VARS)
#LOCAL_MODULE:= libavformat
#LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg/output/lib/libavformat.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/output/include
#include $(PREBUILT_SHARED_LIBRARY)
# 
#include $(CLEAR_VARS)
#LOCAL_MODULE:= libswscale
#LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg/output/lib/libswscale.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/output/include
#include $(PREBUILT_SHARED_LIBRARY)
# 
#include $(CLEAR_VARS)
#LOCAL_MODULE:= libavutil
#LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg/output/lib/libavutil.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/output/include
#include $(PREBUILT_SHARED_LIBRARY)
# 
#include $(CLEAR_VARS)
#LOCAL_MODULE:= libavfilter
#LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg/output/lib/libavfilter.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/output/include
#include $(PREBUILT_SHARED_LIBRARY)
# 
#include $(CLEAR_VARS)
#LOCAL_MODULE:= libswresample
#LOCAL_SRC_FILES:= $(LOCAL_PATH)/ffmpeg/output/lib/libswresample.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/output/include
#include $(PREBUILT_SHARED_LIBRARY)
#
#include $(CLEAR_VARS)
#LOCAL_MODULE    := libffmpeg_android
#LOCAL_SRC_FILES := com_ndh_ngplayer_NativeCall.c
##LOCAL_LDLIBS := -llog -ljnigraphics -lz -landroid
#
#LOCAL_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/libs/include
#LOCAL_SHARED_LIBRARIES := libavformat libavcodec libswscale libavutil
#
##LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
#
#include $(BUILD_SHARED_LIBRARY)
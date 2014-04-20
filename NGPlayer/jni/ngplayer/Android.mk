LOCAL_NGPLAYER_PATH=${LOCAL_PATH}/ngplayer

include $(CLEAR_VARS)
LOCAL_MODULE    := libffmpeg_android
LOCAL_SRC_FILES := ngplayer/com_ndh_ngplayer_NativeCall.c
#LOCAL_C_INCLUDES := $(LOCAL_PATH)
#LOCAL_C_INCLUDES := $(LOCAL_PATH)/ffmpeg/libavcodec \
#					$(LOCAL_PATH)/ffmpeg/libavfilter \
#					$(LOCAL_PATH)/ffmpeg/libavformat \
#					$(LOCAL_PATH)/ffmpeg/libavutil \
#					$(LOCAL_PATH)/ffmpeg/libswscale
LOCAL_LDLIBS := -llog
LOCAL_SHARED_LIBRARIES := ffmpeg
include $(BUILD_SHARED_LIBRARY)

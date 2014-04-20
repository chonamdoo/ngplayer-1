#ifdef __cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <string.h>
#include <stddef.h>

#include <android/log.h>
#include "com_ndh_ngplayer_NativeCall.h"

//#include "libavcodec/avcodec.h"
//#include "libavformat/avformat.h"
//#include "libavutil/avutil.h"

#ifdef __cplusplus
}
#endif

#define NULL 0

const char * const TAG = "NativeCall";
//AVFormatContext *gFormatCtx = NULL;
char *gVideoFileName = NULL;


JNIEXPORT jstring JNICALL Java_com_ndh_ngplayer_NativeCall_sprintf(JNIEnv *env, jobject obj, jstring fmt, jobjectArray args)
{
	gVideoFileName = (char *) (*env)->GetStringUTFChars(env, fmt, NULL);
	__android_log_print(ANDROID_LOG_INFO, TAG, "Init %s\n", gVideoFileName);

//	avcodec_register_all();
//	__android_log_print(ANDROID_LOG_INFO, TAG, "avcodec_register_all\n");
//
//	av_register_all();
//	__android_log_print(ANDROID_LOG_INFO, TAG, "av_register_all\n");

	char* str = (char*) malloc(256);
	memset(str, 0, 0);
//	sprintf(str, "version: %d", avutil_version());
	return (*env)->NewStringUTF(env, str);
}

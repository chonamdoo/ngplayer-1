#!/bin/bash

NDK=$ANDROID_NDK_ROOT
PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.6/prebuilt/linux-x86_64
PLATFORM=$NDK/platforms/android-14/arch-arm
function build_one
{
./configure --target-os=linux \
	--prefix=$PREFIX \
	--arch=arm \
	--disable-shared \
	--extra-cflags=" -O3 -fpic -DANDROID -DHAVE_SYS_UIO_H=1 -Dipv6mr_interface=ipv6mr_ifindex -fasm -Wno-psabi -fno-short-enums  -fno-strict-aliasing -finline-limit=300 $OPTIMIZE_CFLAGS " \
	--enable-static \
	--extra-ldflags="-Wl,-rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib  -nostdlib -lc -lm -ldl -llog" \
	--enable-version3 \
	--enable-gpl \
	--enable-nonfree \
	--disable-debug \
	--disable-programs \
	--disable-avdevice \
	--enable-swresample \
	--enable-swscale \
	--enable-swscale-alpha \
	--enable-decoders \
    	--disable-ffplay \
    	--disable-ffprobe \
    	--disable-ffserver \
    	--disable-network \
	--enable-cross-compile \
	--cross-prefix=$PREBUILT/bin/arm-linux-androideabi- \
	--extra-cflags="--sysroot=$PLATFORM" \
	--extra-ldflags="--sysroot=$PLATFORM" 
	make clean 
	make -j4
	make install

$PREBUILT/bin/arm-linux-androideabi-gcc --sysroot=$PLATFORM -shared -o $PREFIX/libffmpeg.so \
	-Wl,--whole-archive libavcodec/libavcodec.a libavformat/libavformat.a libavutil/libavutil.a libswscale/libswscale.a libswresample/libswresample.a \
	-Wl,--no-whole-archive -lm -lz
}


#arm v7n
CPU=armv7-a
OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=neon -marm -march=$CPU -mtune=cortex-a8"
PREFIX=../ffmpeg-build/armeabi-v7a
ADDITIONAL_CONFIGURE_FLAG=--enable-neon
build_one



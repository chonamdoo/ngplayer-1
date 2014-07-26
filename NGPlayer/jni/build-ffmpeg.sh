#!/bin/bash

NDK=$ANDROID_NDK_ROOT
OS=`uname -s | tr '[A-Z]' '[a-z]'`
PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.6/prebuilt/$OS-x86_64
PLATFORM=$NDK/platforms/android-14/arch-arm
PREFIX_BASE=./ffmpeg-build

function build_one
{
	if [ ! -e ffmpeg ]; then
		echo "not found ffmpeg directory.";
		exit 1;
	fi

	cd ffmpeg
	echo "cd ffmpeg"

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
		--extra-ldflags="--sysroot=$PLATFORM" \
		$ADDITIONAL_CONFIGURE_FLAG || exit 1;
		make clean || exit 1; 
		make -j4 || exit 1;
		make install || exit 1;

	$PREBUILT/bin/arm-linux-androideabi-gcc --sysroot=$PLATFORM -shared -o $PREFIX/${SONAME} \
		-Wl,--whole-archive libavcodec/libavcodec.a libavformat/libavformat.a libavutil/libavutil.a libswscale/libswscale.a libswresample/libswresample.a \
		-Wl,--no-whole-archive -lm -lz

	cd ..
	echo "cd .."
}


#arm v5
CPU=armv5
OPTIMIZE_CFLAGS="-marm -march=$CPU"
PREFIX=${PREFIX_BASE}/armeabi
ADDITIONAL_CONFIGURE_FLAG=
SONAME=libffmpeg.so
#build_one


#arm v7vfpv3
CPU=armv7-a
OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=vfpv3-d16 -marm -march=$CPU -mthumb -D__thumb__"
PREFIX=${PREFIX_BASE}/armeabi-v7a
ADDITIONAL_CONFIGURE_FLAG=
SONAME=libffmpeg.so
build_one


#arm v7 + neon
CPU=armv7-a
OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=neon -marm -march=$CPU -mtune=cortex-a8 -mthumb -D__thumb__"
PREFIX=${PREFIX_BASE}/armeabi-v7a-neon
ADDITIONAL_CONFIGURE_FLAG=--enable-neon
SONAME=libffmpeg-neon.so
build_one

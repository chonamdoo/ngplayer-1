FFMPEG_DIR=$PWD
export PREFIX=$FFMPEG_DIR/output
export TMPDIR=$FFMPEG_DIR/tmpdir
export ANDROID_ROOT=${ANDROID_TOOLCHAIN}

echo "PREFIX: $PREFIX"
echo "TMPDIR: $TMPDIR"
echo "ANDROID_ROOT: $ANDROID_ROOT"

if [ ! -e $PREFIX ] ; then
	echo "mkdir $PREFIX"
	mkdir $PREFIX
else
	echo "clear in $PREFIX"
	rm -rf $PREFIX/*
fi


if [ ! -e $TMPDIR ] ; then
	echo "mkdir $TMPDIR"
	mkdir $TMPDIR
else
	echo "clear in $TMPDIR"
	rm -rf $TMPDIR/*
fi

./configure --prefix=$PREFIX \
 --disable-shared \
 --enable-static \
 --target-os=linux \
 --arch=arm \
 --enable-cross-compile \
 --cc=$ANDROID_ROOT/bin/arm-linux-androideabi-gcc \
 --cross-prefix=$ANDROID_ROOT/bin/arm-linux-androideabi- \
 --extra-cflags="-marm -march=armv7-a -mfloat-abi=softfp -mfpu=neon" \
 --extra-ldflags="-Wl,--fix-cortex-a8" \
 --disable-doc \
 --enable-ffmpeg \
 --disable-ffplay \
 --disable-ffprobe \
 --disable-ffserver \
 --enable-avdevice \
 --enable-filters \
 --disable-yasm \
 --enable-network \
 --enable-protocol=tcp \
 --enable-demuxer=rtsp \
 --enable-decoder=h264
# --enable-devices \

 make clean && make && make install

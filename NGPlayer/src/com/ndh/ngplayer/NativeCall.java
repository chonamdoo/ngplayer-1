package com.ndh.ngplayer;

public class NativeCall {

	static {
		System.loadLibrary("ffmpeg_android");
	}
	
	public native String sprintf(String fmt, Object... args);
}
